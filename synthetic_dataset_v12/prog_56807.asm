; DESCRIPTION: Places a black line segment connecting (247, 217) to (8, 63).
; PLAN: r0=247(x1), r1=217(y1), r2=8(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 217
LDI r2, 8
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
