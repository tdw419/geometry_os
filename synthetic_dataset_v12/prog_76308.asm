; DESCRIPTION: Places a black line segment connecting (195, 5) to (8, 119).
; PLAN: r0=195(x1), r1=5(y1), r2=8(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 5
LDI r2, 8
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
