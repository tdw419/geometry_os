; DESCRIPTION: Places a black line segment connecting (393, 62) to (275, 1).
; PLAN: r0=393(x1), r1=62(y1), r2=275(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 62
LDI r2, 275
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
