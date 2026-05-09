; DESCRIPTION: Draws a blue line from (6, 143) to (460, 7).
; PLAN: r0=6(x1), r1=143(y1), r2=460(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 143
LDI r2, 460
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
