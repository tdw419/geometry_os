; DESCRIPTION: Places a blue line segment connecting (430, 166) to (272, 20).
; PLAN: r0=430(x1), r1=166(y1), r2=272(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 166
LDI r2, 272
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
