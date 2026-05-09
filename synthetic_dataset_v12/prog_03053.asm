; DESCRIPTION: Places a black line segment connecting (331, 87) to (50, 191).
; PLAN: r0=331(x1), r1=87(y1), r2=50(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 87
LDI r2, 50
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
