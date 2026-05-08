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
    LDI r8, 1
    LDI r5, 0
    LDI r4, 0             ; total packets
    LDI r13, 0            ; rate counter
    LDI r7, 0            ; displayed rate
    LDI r10, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r14, net_path
    LDI r6, 0
    OPEN r14, r6
    MOV r12, r1            ; r12 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r14, 0x080810
    FILL r14

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r14, 0xFFE
    LOAD r14, r14
    LDI r6, 31
    AND r14, r6
    LDI r6, 15
    CMP r14, r6
    JNZ r1, no_sim
    RAND r14
    LDI r6, 0xFFC
    STORE r6, r14
no_sim:

    ; == READ FROM /dev/net ==
    LDI r14, 0xFFC
    LDI r6, 1
    READ r12, r14, r6
    LDI r14, 0
    CMP r1, r14
    JZ r1, no_pkt

    ; Store packet
    LDI r14, 0xFFC
    LOAD r24, r14           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r14, r10
    LDI r6, 2
    SHL r14, r6
    MOV r6, r22
    ADD r6, r14
    STORE r6, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r14, r8
    ADD r6, r14
    MOV r3, r24
    LDI r11, 24
    SHR r3, r11             ; top byte
    STORE r6, r3

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r14, r8
    ADD r6, r14
    LDI r3, 0xFFE
    LOAD r3, r3
    STORE r6, r3

    ; Advance head
    ADD r10, r8
    LDI r14, 32
    CMP r10, r14
    BLT r1, no_wrap
    LDI r10, 0
no_wrap:
    ADD r4, r8
    ADD r13, r8

no_pkt:
    ; == RATE UPDATE ==
    LDI r14, 0xFFE
    LOAD r9, r14
    LDI r14, 63
    AND r9, r14
    LDI r14, 2
    CMP r9, r14
    BGE r1, no_rate
    MOV r7, r13
    LDI r13, 0
no_rate:

    ; == TITLE BAR ==
    LDI r14, 0
    LDI r6, 0
    LDI r3, 256
    LDI r11, 14
    LDI r2, 0x003366
    RECTF r14, r6, r3, r11, r2

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r14, 0xE003
    LDI r6, 0
    LDI r3, 0
    IOCTL r14, r6, r3
    LDI r14, 0
    CMP r1, r14
    JZ r1, net_down_label

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
    CMP r4, r14
    JZ r1, show_empty

    ; Determine entry index
    LDI r14, 28
    CMP r4, r14
    BGE r1, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r4
    BLT r1, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r14, r10
    LDI r6, 28
    SUB r14, r6
    ADD r14, r25
    LDI r6, 31
    AND r14, r6

do_draw_entry:
    ; r14 = entry index
    LDI r6, 2
    SHL r14, r6             ; entry * 4
    MOV r3, r22
    ADD r3, r14             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r6, r3
    ADD r6, r8
    LOAD r2, r6           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r11, 0xE0
    AND r2, r11            ; top 3 bits
    LDI r11, 5
    SHR r2, r11            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r11, 0x44
    OR r2, r11             ; ensure minimum brightness

    ; Draw row bar
    LDI r14, 2
    LDI r6, 256
    LDI r11, 7
    RECTF r14, r17, r6, r11, r2

    ; Draw a bright accent line on left
    MOV r14, r3
    LOAD r15, r14           ; data word
    LDI r9, 16
    SHR r15, r9
    LDI r9, 0xF
    AND r15, r9
    LDI r9, 2
    MUL r15, r9
    ADD r15, r8             ; width = 3..33
    LDI r9, 0x00CCFF      ; cyan accent
    RECTF r14, r17, r15, r11, r9

skip_row:
    LDI r14, 8
    ADD r17, r14
    ADD r25, r8
    LDI r14, 28
    CMP r25, r14
    BLT r1, pkt_row
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
    LDI r6, 242
    LDI r3, 256
    LDI r11, 14
    LDI r2, 0x002244
    RECTF r14, r6, r3, r11, r2

    ; Build "PKT:N" at 0x6000
    LDI r14, 0x6000
    LDI r2, 80            ; 'P'
    STORE r14, r2
    ADD r14, r8
    LDI r2, 75
    STORE r14, r2
    ADD r14, r8
    LDI r2, 84
    STORE r14, r2
    ADD r14, r8
    LDI r2, 58
    STORE r14, r2
    ADD r14, r8
    LDI r2, 32
    STORE r14, r2
    ADD r14, r8

    ; Decimal convert r4
    MOV r6, r4
    LDI r3, 0x6020
    LDI r2, 0
    STORE r3, r2
    ; Special case: if r4 == 0, write '0'
    LDI r2, 0
    CMP r6, r2
    JNZ r1, dec_nonzero
    LDI r2, 48
    SUB r3, r8
    STORE r3, r2
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r6
    DIV r28, r27
    MUL r28, r27
    MOV r29, r6
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r3, r8
    STORE r3, r29
    LDI r28, 10
    DIV r6, r28
    LDI r28, 0
    CMP r6, r28
    JNZ r1, dec_nonzero
dec_copy:
    LDI r14, 0x6005
dec_cp:
    LOAD r6, r3
    LDI r27, 0
    CMP r6, r27
    JZ r1, dec_cp_done
    STORE r14, r6
    ADD r14, r8
    ADD r3, r8
    JMP dec_cp
dec_cp_done:
    LDI r2, 0
    STORE r14, r2

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r14, 0x6030
    LDI r2, 82
    STORE r14, r2
    ADD r14, r8
    LDI r2, 65
    STORE r14, r2
    ADD r14, r8
    LDI r2, 84
    STORE r14, r2
    ADD r14, r8
    LDI r2, 69
    STORE r14, r2
    ADD r14, r8
    LDI r2, 58
    STORE r14, r2
    ADD r14, r8
    LDI r2, 32
    STORE r14, r2
    ADD r14, r8

    ; Decimal convert r7
    MOV r6, r7
    LDI r3, 0x6050
    LDI r2, 0
    STORE r3, r2
    LDI r2, 0
    CMP r6, r2
    JNZ r1, rdec_nonzero
    LDI r2, 48
    SUB r3, r8
    STORE r3, r2
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r6
    DIV r28, r27
    MUL r28, r27
    MOV r29, r6
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r3, r8
    STORE r3, r29
    LDI r28, 10
    DIV r6, r28
    LDI r28, 0
    CMP r6, r28
    JNZ r1, rdec_nonzero
rdec_copy:
    LDI r14, 0x6037
rdec_cp:
    LOAD r6, r3
    LDI r27, 0
    CMP r6, r27
    JZ r1, rdec_done
    STORE r14, r6
    ADD r14, r8
    ADD r3, r8
    JMP rdec_cp
rdec_done:
    LDI r2, 47
    STORE r14, r2
    ADD r14, r8
    LDI r2, 115
    STORE r14, r2
    ADD r14, r8
    LDI r2, 0
    STORE r14, r2

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
