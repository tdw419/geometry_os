; DESCRIPTION: Draws a magenta line from (505, 83) to (460, 2).
; PLAN: r0=505(x1), r1=83(y1), r2=460(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 83
LDI r2, 460
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
