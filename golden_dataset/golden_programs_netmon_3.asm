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
    LDI r7, 1
    LDI r8, 0
    LDI r10, 0             ; total packets
    LDI r6, 0            ; rate counter
    LDI r13, 0            ; displayed rate
    LDI r4, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r9, net_path
    LDI r1, 0
    OPEN r9, r1
    MOV r14, r3            ; r14 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r9, 0x080810
    FILL r9

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r9, 0xFFE
    LOAD r9, r9
    LDI r1, 31
    AND r9, r1
    LDI r1, 15
    CMP r9, r1
    JNZ r3, no_sim
    RAND r9
    LDI r1, 0xFFC
    STORE r1, r9
no_sim:

    ; == READ FROM /dev/net ==
    LDI r9, 0xFFC
    LDI r1, 1
    READ r14, r9, r1
    LDI r9, 0
    CMP r3, r9
    JZ r3, no_pkt

    ; Store packet
    LDI r9, 0xFFC
    LOAD r24, r9           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r9, r4
    LDI r1, 2
    SHL r9, r1
    MOV r1, r22
    ADD r1, r9
    STORE r1, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r9, r7
    ADD r1, r9
    MOV r11, r24
    LDI r5, 24
    SHR r11, r5             ; top byte
    STORE r1, r11

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r9, r7
    ADD r1, r9
    LDI r11, 0xFFE
    LOAD r11, r11
    STORE r1, r11

    ; Advance head
    ADD r4, r7
    LDI r9, 32
    CMP r4, r9
    BLT r3, no_wrap
    LDI r4, 0
no_wrap:
    ADD r10, r7
    ADD r6, r7

no_pkt:
    ; == RATE UPDATE ==
    LDI r9, 0xFFE
    LOAD r15, r9
    LDI r9, 63
    AND r15, r9
    LDI r9, 2
    CMP r15, r9
    BGE r3, no_rate
    MOV r13, r6
    LDI r6, 0
no_rate:

    ; == TITLE BAR ==
    LDI r9, 0
    LDI r1, 0
    LDI r11, 256
    LDI r5, 14
    LDI r12, 0x003366
    RECTF r9, r1, r11, r5, r12

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r9, 0xE003
    LDI r1, 0
    LDI r11, 0
    IOCTL r9, r1, r11
    LDI r9, 0
    CMP r3, r9
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
    LDI r9, 0
    CMP r10, r9
    JZ r3, show_empty

    ; Determine entry index
    LDI r9, 28
    CMP r10, r9
    BGE r3, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r10
    BLT r3, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r9, r4
    LDI r1, 28
    SUB r9, r1
    ADD r9, r25
    LDI r1, 31
    AND r9, r1

do_draw_entry:
    ; r9 = entry index
    LDI r1, 2
    SHL r9, r1             ; entry * 4
    MOV r11, r22
    ADD r11, r9             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r1, r11
    ADD r1, r7
    LOAD r12, r1           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r5, 0xE0
    AND r12, r5            ; top 3 bits
    LDI r5, 5
    SHR r12, r5            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r5, 0x44
    OR r12, r5             ; ensure minimum brightness

    ; Draw row bar
    LDI r9, 2
    LDI r1, 256
    LDI r5, 7
    RECTF r9, r17, r1, r5, r12

    ; Draw a bright accent line on left
    MOV r9, r11
    LOAD r0, r9           ; data word
    LDI r15, 16
    SHR r0, r15
    LDI r15, 0xF
    AND r0, r15
    LDI r15, 2
    MUL r0, r15
    ADD r0, r7             ; width = 3..33
    LDI r15, 0x00CCFF      ; cyan accent
    RECTF r9, r17, r0, r5, r15

skip_row:
    LDI r9, 8
    ADD r17, r9
    ADD r25, r7
    LDI r9, 28
    CMP r25, r9
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
    LDI r9, 0
    LDI r1, 242
    LDI r11, 256
    LDI r5, 14
    LDI r12, 0x002244
    RECTF r9, r1, r11, r5, r12

    ; Build "PKT:N" at 0x6000
    LDI r9, 0x6000
    LDI r12, 80            ; 'P'
    STORE r9, r12
    ADD r9, r7
    LDI r12, 75
    STORE r9, r12
    ADD r9, r7
    LDI r12, 84
    STORE r9, r12
    ADD r9, r7
    LDI r12, 58
    STORE r9, r12
    ADD r9, r7
    LDI r12, 32
    STORE r9, r12
    ADD r9, r7

    ; Decimal convert r10
    MOV r1, r10
    LDI r11, 0x6020
    LDI r12, 0
    STORE r11, r12
    ; Special case: if r10 == 0, write '0'
    LDI r12, 0
    CMP r1, r12
    JNZ r3, dec_nonzero
    LDI r12, 48
    SUB r11, r7
    STORE r11, r12
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r1
    DIV r28, r27
    MUL r28, r27
    MOV r29, r1
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r11, r7
    STORE r11, r29
    LDI r28, 10
    DIV r1, r28
    LDI r28, 0
    CMP r1, r28
    JNZ r3, dec_nonzero
dec_copy:
    LDI r9, 0x6005
dec_cp:
    LOAD r1, r11
    LDI r27, 0
    CMP r1, r27
    JZ r3, dec_cp_done
    STORE r9, r1
    ADD r9, r7
    ADD r11, r7
    JMP dec_cp
dec_cp_done:
    LDI r12, 0
    STORE r9, r12

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r9, 0x6030
    LDI r12, 82
    STORE r9, r12
    ADD r9, r7
    LDI r12, 65
    STORE r9, r12
    ADD r9, r7
    LDI r12, 84
    STORE r9, r12
    ADD r9, r7
    LDI r12, 69
    STORE r9, r12
    ADD r9, r7
    LDI r12, 58
    STORE r9, r12
    ADD r9, r7
    LDI r12, 32
    STORE r9, r12
    ADD r9, r7

    ; Decimal convert r13
    MOV r1, r13
    LDI r11, 0x6050
    LDI r12, 0
    STORE r11, r12
    LDI r12, 0
    CMP r1, r12
    JNZ r3, rdec_nonzero
    LDI r12, 48
    SUB r11, r7
    STORE r11, r12
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r1
    DIV r28, r27
    MUL r28, r27
    MOV r29, r1
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r11, r7
    STORE r11, r29
    LDI r28, 10
    DIV r1, r28
    LDI r28, 0
    CMP r1, r28
    JNZ r3, rdec_nonzero
rdec_copy:
    LDI r9, 0x6037
rdec_cp:
    LOAD r1, r11
    LDI r27, 0
    CMP r1, r27
    JZ r3, rdec_done
    STORE r9, r1
    ADD r9, r7
    ADD r11, r7
    JMP rdec_cp
rdec_done:
    LDI r12, 47
    STORE r9, r12
    ADD r9, r7
    LDI r12, 115
    STORE r9, r12
    ADD r9, r7
    LDI r12, 0
    STORE r9, r12

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
