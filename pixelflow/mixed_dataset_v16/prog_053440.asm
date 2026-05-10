; DESCRIPTION: Places a orange line segment connecting (402, 37) to (114, 178).
; PLAN: r0=402(x1), r1=37(y1), r2=114(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 37
LDI r2, 114
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
