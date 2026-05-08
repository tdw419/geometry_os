; DESCRIPTION: This GeOS assembly code demonstrates the use of wall-clock timers and alarms by visualizing elapsed time with a vertical bar and marking an alarm event. It uses `TMR_GET` to measure time intervals, `TMR_WAIT` for delays, and `ALARM_SET` to trigger an action after a specified timeout. The program also shows the last hexadecimal digit of the elapsed milliseconds as dots on the screen.

; timer_demo.asm -- Phase 222: Wall-Clock Timer & Alarm Demo
; Demonstrates TMR_GET, TMR_WAIT, ALARM_SET, ALARM_CLR
;
; Visual output:
;   - Top bar: elapsed milliseconds since start (bar height)
;   - Bottom marker: alarm fire indicator (green pixel at row 20)
;   - Dot row: last hex digit of elapsed ms

; --- Part 1: TMR_GET baseline ---
TMR_GET r9

; --- Part 2: TMR_WAIT 200ms ---
IMM r3, 200
TMR_WAIT r3

; --- Part 3: TMR_GET again, compute delta ---
TMR_GET r8
SUB r12, r8, r9

; --- Part 4: Visualize elapsed time as vertical bar ---
; Bar at x=2, height = min(r12/10, 30), color=4 (blue)
DIV r13, r12, 10
IMM r10, 30
CMP r13, r10
JGE r13, r10, cap_height
JMP draw_bar
cap_height:
MOV r13, r10
draw_bar:
IMM r1, 2       ; x
IMM r5, 0      ; y
bar_loop:
CMP r13, 0
JEQ r13, 0, bar_done
PXL r1, r5, 4
INC r5
DEC r13
JMP bar_loop
bar_done:

; --- Part 5: Set alarm for 100ms, writes 99 to RAM[0xF00] ---
IMM r2, 100    ; delay ms
IMM r11, 0xF00  ; RAM address
IMM r0, 99     ; value to write
ALARM_SET r2, r11, r0

; --- Part 6: Spin until alarm fires ---
alarm_wait:
FRAME
LOAD r4, 0xF00
CMP r4, 99
JNE r4, 99, alarm_wait

; --- Part 7: Alarm fired! Mark success ---
IMM r15, 5      ; x
IMM r16, 20     ; y (bottom area)
PXL r15, r16, 2 ; green pixel

; --- Part 8: Show last hex digit of elapsed ms as dots ---
AND r20, r12, 0xF
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
