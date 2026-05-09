; DESCRIPTION: Draws a yellow line from (78, 17) to (16, 163).
; PLAN: r0=78(x1), r1=17(y1), r2=16(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 17
LDI r2, 16
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
