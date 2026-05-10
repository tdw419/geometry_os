; DESCRIPTION: Draws a yellow line from (359, 163) to (219, 240).
; PLAN: r0=359(x1), r1=163(y1), r2=219(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 163
LDI r2, 219
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
