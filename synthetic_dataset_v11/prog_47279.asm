; DESCRIPTION: Draws a green line from (244, 240) to (200, 212).
; PLAN: r0=244(x1), r1=240(y1), r2=200(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 240
LDI r2, 200
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
