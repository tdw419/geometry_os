; DESCRIPTION: Places a black line segment connecting (248, 180) to (115, 156).
; PLAN: r0=248(x1), r1=180(y1), r2=115(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 180
LDI r2, 115
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
