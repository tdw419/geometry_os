; DESCRIPTION: Draws a green line from (219, 200) to (163, 188).
; PLAN: r0=219(x1), r1=200(y1), r2=163(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 200
LDI r2, 163
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
