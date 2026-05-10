; DESCRIPTION: Places a black line segment connecting (275, 205) to (13, 23).
; PLAN: r0=275(x1), r1=205(y1), r2=13(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 205
LDI r2, 13
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
