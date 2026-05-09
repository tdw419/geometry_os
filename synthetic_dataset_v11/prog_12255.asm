; DESCRIPTION: Places a black line segment connecting (89, 128) to (107, 26).
; PLAN: r0=89(x1), r1=128(y1), r2=107(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 128
LDI r2, 107
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
