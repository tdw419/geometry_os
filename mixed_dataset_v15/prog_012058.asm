; DESCRIPTION: Draws a yellow line from (192, 157) to (219, 157).
; PLAN: r0=192(x1), r1=157(y1), r2=219(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 157
LDI r2, 219
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
