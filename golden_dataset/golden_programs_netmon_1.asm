; DESCRIPTION: This GeOS assembly code implements a network packet viewer that reads from the `/dev/net` device, displays a scrolling log of packets with hex data and rate statistics, and simulates traffic by writing random data to the net port. The interface includes a title bar, a scrolling packet log area, and a status bar showing packet count and rate.

; netmon.asm -- Phase 141: Network Packet Viewer
;
; Visual network packet monitor. Reads from /dev/net device,
; displays scrolling packet log with hex data and rate stats.
; Simulates traffic by writing random data to the net port.
;
; Layout:
;   Row 0-1: Title bar
;   Row 2-29: Scrolling packet log (colored bars per packet)
;   Row 30-31: Status bar with packet count and rate
;
; Opcodes: LDI, MOV, ADD, SUB, MUL, DIV, AND, OR, SHL, SHR, SAR
;          MOD, CMP, JZ, JNZ, BLT, BGE, JMP, FILL, RECTF, PSET
;          DRAWTEXT, TEXT, IKEY, RAND, FRAME, OPEN, READ, IOCTL
;          STORE, LOAD

; == INIT ==
    LDI r13, 1
    LDI r0, 0
    LDI r1, 0             ; total packets
    LDI r9, 0            ; rate counter
    LDI r6, 0            ; displayed rate
    LDI r5, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r14, net_path
    LDI r11, 0
    OPEN r14, r11
    MOV r2, r3            ; r2 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r14, 0x080810
    FILL r14

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r14, 0xFFE
    LOAD r14, r14
    LDI r11, 31
    AND r14, r11
    LDI r11, 15
    CMP r14, r11
    JNZ r3, no_sim
    RAND r14
    LDI r11, 0xFFC
    STORE r11, r14
no_sim:

    ; == READ FROM /dev/net ==
    LDI r14, 0xFFC
    LDI r11, 1
    READ r2, r14, r11
    LDI r14, 0
    CMP r3, r14
    JZ r3, no_pkt

    ; Store packet
    LDI r14, 0xFFC
    LOAD r24, r14           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r14, r5
    LDI r11, 2
    SHL r14, r11
    MOV r11, r22
    ADD r11, r14
    STORE r11, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r14, r13
    ADD r11, r14
    MOV r15, r24
    LDI r10, 24
    SHR r15, r10             ; top byte
    STORE r11, r15

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r14, r13
    ADD r11, r14
    LDI r15, 0xFFE
    LOAD r15, r15
    STORE r11, r15

    ; Advance head
    ADD r5, r13
    LDI r14, 32
    CMP r5, r14
    BLT r3, no_wrap
    LDI r5, 0
no_wrap:
    ADD r1, r13
    ADD r9, r13

no_pkt:
    ; == RATE UPDATE ==
    LDI r14, 0xFFE
    LOAD r8, r14
    LDI r14, 63
    AND r8, r14
    LDI r14, 2
    CMP r8, r14
    BGE r3, no_rate
    MOV r6, r9
    LDI r9, 0
no_rate:

    ; == TITLE BAR ==
    LDI r14, 0
    LDI r11, 0
    LDI r15, 256
    LDI r10, 14
    LDI r12, 0x003366
    RECTF r14, r11, r15, r10, r12

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r14, 0xE003
    LDI r11, 0
    LDI r15, 0
    IOCTL r14, r11, r15
    LDI r14, 0
    CMP r3, r14
    JZ r3, net_down_label

    ; Net status indicator
    LDI r16, 90
    LDI r17, 3
    LDI r18, up_str
    LDI r19, 0x00FF00
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20
    JMP pkt_draw

net_down_label:
    LDI r16, 90
    LDI r17, 3
    LDI r18, down_str
    LDI r19, 0xFF0000
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

pkt_draw:
    ; == DRAW PACKET LOG ==
    ; Show last 28 packets as colored bars
    LDI r25, 0             ; display row (0-27)
    LDI r17, 16            ; start y

pkt_row:
    LDI r14, 0
    CMP r1, r14
    JZ r3, show_empty

    ; Determine entry index
    LDI r14, 28
    CMP r1, r14
    BGE r3, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r1
    BLT r3, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r14, r5
    LDI r11, 28
    SUB r14, r11
    ADD r14, r25
    LDI r11, 31
    AND r14, r11

do_draw_entry:
    ; r14 = entry index
    LDI r11, 2
    SHL r14, r11             ; entry * 4
    MOV r15, r22
    ADD r15, r14             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r11, r15
    ADD r11, r13
    LOAD r12, r11           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r10, 0xE0
    AND r12, r10            ; top 3 bits
    LDI r10, 5
    SHR r12, r10            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r10, 0x44
    OR r12, r10             ; ensure minimum brightness

    ; Draw row bar
    LDI r14, 2
    LDI r11, 256
    LDI r10, 7
    RECTF r14, r17, r11, r10, r12

    ; Draw a bright accent line on left
    MOV r14, r15
    LOAD r7, r14           ; data word
    LDI r8, 16
    SHR r7, r8
    LDI r8, 0xF
    AND r7, r8
    LDI r8, 2
    MUL r7, r8
    ADD r7, r13             ; width = 3..33
    LDI r8, 0x00CCFF      ; cyan accent
    RECTF r14, r17, r7, r10, r8

skip_row:
    LDI r14, 8
    ADD r17, r14
    ADD r25, r13
    LDI r14, 28
    CMP r25, r14
    BLT r3, pkt_row
    JMP draw_stat

show_empty:
    LDI r16, 80
    LDI r17, 130
    LDI r18, empty_str
    LDI r19, 0x555555
    LDI r20, 0
    DRAWTEXT r16, r17, r18, r19, r20

draw_stat:
    ; == STATUS BAR ==
    LDI r14, 0
    LDI r11, 242
    LDI r15, 256
    LDI r10, 14
    LDI r12, 0x002244
    RECTF r14, r11, r15, r10, r12

    ; Build "PKT:N" at 0x6000
    LDI r14, 0x6000
    LDI r12, 80            ; 'P'
    STORE r14, r12
    ADD r14, r13
    LDI r12, 75
    STORE r14, r12
    ADD r14, r13
    LDI r12, 84
    STORE r14, r12
    ADD r14, r13
    LDI r12, 58
    STORE r14, r12
    ADD r14, r13
    LDI r12, 32
    STORE r14, r12
    ADD r14, r13

    ; Decimal convert r1
    MOV r11, r1
    LDI r15, 0x6020
    LDI r12, 0
    STORE r15, r12
    ; Special case: if r1 == 0, write '0'
    LDI r12, 0
    CMP r11, r12
    JNZ r3, dec_nonzero
    LDI r12, 48
    SUB r15, r13
    STORE r15, r12
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r11
    DIV r28, r27
    MUL r28, r27
    MOV r29, r11
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r15, r13
    STORE r15, r29
    LDI r28, 10
    DIV r11, r28
    LDI r28, 0
    CMP r11, r28
    JNZ r3, dec_nonzero
dec_copy:
    LDI r14, 0x6005
dec_cp:
    LOAD r11, r15
    LDI r27, 0
    CMP r11, r27
    JZ r3, dec_cp_done
    STORE r14, r11
    ADD r14, r13
    ADD r15, r13
    JMP dec_cp
dec_cp_done:
    LDI r12, 0
    STORE r14, r12

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r14, 0x6030
    LDI r12, 82
    STORE r14, r12
    ADD r14, r13
    LDI r12, 65
    STORE r14, r12
    ADD r14, r13
    LDI r12, 84
    STORE r14, r12
    ADD r14, r13
    LDI r12, 69
    STORE r14, r12
    ADD r14, r13
    LDI r12, 58
    STORE r14, r12
    ADD r14, r13
    LDI r12, 32
    STORE r14, r12
    ADD r14, r13

    ; Decimal convert r6
    MOV r11, r6
    LDI r15, 0x6050
    LDI r12, 0
    STORE r15, r12
    LDI r12, 0
    CMP r11, r12
    JNZ r3, rdec_nonzero
    LDI r12, 48
    SUB r15, r13
    STORE r15, r12
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r11
    DIV r28, r27
    MUL r28, r27
    MOV r29, r11
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r15, r13
    STORE r15, r29
    LDI r28, 10
    DIV r11, r28
    LDI r28, 0
    CMP r11, r28
    JNZ r3, rdec_nonzero
rdec_copy:
    LDI r14, 0x6037
rdec_cp:
    LOAD r11, r15
    LDI r27, 0
    CMP r11, r27
    JZ r3, rdec_done
    STORE r14, r11
    ADD r14, r13
    ADD r15, r13
    JMP rdec_cp
rdec_done:
    LDI r12, 47
    STORE r14, r12
    ADD r14, r13
    LDI r12, 115
    STORE r14, r12
    ADD r14, r13
    LDI r12, 0
    STORE r14, r12

    LDI r16, 130
    LDI r17, 244
    LDI r18, 0x6030
    LDI r19, 0xFFFF00
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    FRAME
    JMP main_loop

; == DATA ==
.org 0x4000
net_path:
    .asciz "/dev/net"
    .db 0

title_str:
    .asciz "NETMON - Packet Viewer"
    .db 0

up_str:
    .asciz "UP"
    .db 0

down_str:
    .asciz "DOWN"
    .db 0

empty_str:
    .asciz "NO PACKETS YET"
    .db 0
