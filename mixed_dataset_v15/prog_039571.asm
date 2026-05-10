; DESCRIPTION: Places a black line segment connecting (268, 62) to (509, 66).
; PLAN: r0=268(x1), r1=62(y1), r2=509(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 62
LDI r2, 509
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
