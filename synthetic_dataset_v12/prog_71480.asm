; DESCRIPTION: Places a yellow line segment connecting (272, 164) to (283, 5).
; PLAN: r0=272(x1), r1=164(y1), r2=283(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 164
LDI r2, 283
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
