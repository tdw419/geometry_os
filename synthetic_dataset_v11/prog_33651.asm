; DESCRIPTION: Draws a yellow line from (227, 128) to (164, 22).
; PLAN: r0=227(x1), r1=128(y1), r2=164(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 128
LDI r2, 164
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
