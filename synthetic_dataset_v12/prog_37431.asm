; DESCRIPTION: Places a black line segment connecting (402, 139) to (487, 252).
; PLAN: r0=402(x1), r1=139(y1), r2=487(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 139
LDI r2, 487
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
