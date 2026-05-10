; DESCRIPTION: Draws a yellow line from (448, 116) to (19, 163).
; PLAN: r0=448(x1), r1=116(y1), r2=19(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 116
LDI r2, 19
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
