; DESCRIPTION: Places a black line segment connecting (66, 62) to (160, 249).
; PLAN: r0=66(x1), r1=62(y1), r2=160(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 62
LDI r2, 160
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
