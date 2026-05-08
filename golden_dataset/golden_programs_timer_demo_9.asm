; DESCRIPTION: Geometry OS program to draw a colored object.

; timer_demo.asm -- Phase 222: Wall-Clock Timer & Alarm Demo
; Demonstrates TMR_GET, TMR_WAIT, ALARM_SET, ALARM_CLR
;
; Visual output:
;   - Top bar: elapsed milliseconds since start (bar height)
;   - Bottom marker: alarm fire indicator (green pixel at row 20)
;   - Dot row: last hex digit of elapsed ms

; --- Part 1: TMR_GET baseline ---
TMR_GET r14

; --- Part 2: TMR_WAIT 200ms ---
IMM r9, 200
TMR_WAIT r9

; --- Part 3: TMR_GET again, compute delta ---
TMR_GET r2
SUB r13, r2, r14

; --- Part 4: Visualize elapsed time as vertical bar ---
; Bar at x=2, height = min(r13/10, 30), color=4 (blue)
DIV r5, r13, 10
IMM r1, 30
CMP r5, r1
JGE r5, r1, cap_height
JMP draw_bar
cap_height:
MOV r5, r1
draw_bar:
IMM r11, 2       ; x
IMM r0, 0      ; y
bar_loop:
CMP r5, 0
JEQ r5, 0, bar_done
PXL r11, r0, 4
INC r0
DEC r5
JMP bar_loop
bar_done:

; --- Part 5: Set alarm for 100ms, writes 99 to RAM[0xF00] ---
IMM r8, 100    ; delay ms
IMM r4, 0xF00  ; RAM address
IMM r10, 99     ; value to write
ALARM_SET r8, r4, r10

; --- Part 6: Spin until alarm fires ---
alarm_wait:
FRAME
LOAD r6, 0xF00
CMP r6, 99
JNE r6, 99, alarm_wait

; --- Part 7: Alarm fired! Mark success ---
IMM r15, 5      ; x
IMM r16, 20     ; y (bottom area)
PXL r15, r16, 2 ; green pixel

; --- Part 8: Show last hex digit of elapsed ms as dots ---
AND r20, r13, 0xF
IMM r21, 8      ; start x for dots
IMM r22, 20     ; y (same row as alarm marker)
dot_loop:
CMP r20, 0
JEQ r20, 0, dots_done
PXL r21, r22, 12 ; bright red dots
INC r21
DEC r20
JMP dot_loop
dots_done:

; --- Part 9: Clear the alarm slot ---
IMM r17, 0
ALARM_CLR r17

FRAME
HALT
