; DESCRIPTION: Draws a orange line from (460, 81) to (20, 196).
; PLAN: r0=460(x1), r1=81(y1), r2=20(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 81
LDI r2, 20
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
