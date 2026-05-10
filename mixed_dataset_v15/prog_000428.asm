; DESCRIPTION: Places a black line segment connecting (152, 12) to (289, 26).
; PLAN: r0=152(x1), r1=12(y1), r2=289(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 12
LDI r2, 289
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
