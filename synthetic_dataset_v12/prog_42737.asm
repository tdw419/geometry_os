; DESCRIPTION: Places a black line segment connecting (43, 62) to (466, 32).
; PLAN: r0=43(x1), r1=62(y1), r2=466(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 62
LDI r2, 466
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
