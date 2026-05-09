; DESCRIPTION: Draws a green line from (204, 244) to (84, 227).
; PLAN: r0=204(x1), r1=244(y1), r2=84(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 244
LDI r2, 84
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
