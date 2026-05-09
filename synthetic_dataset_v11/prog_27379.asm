; DESCRIPTION: Places a yellow line segment connecting (97, 244) to (145, 166).
; PLAN: r0=97(x1), r1=244(y1), r2=145(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 244
LDI r2, 145
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
