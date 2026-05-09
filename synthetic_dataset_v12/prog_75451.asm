; DESCRIPTION: Places a black line segment connecting (449, 79) to (179, 241).
; PLAN: r0=449(x1), r1=79(y1), r2=179(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 79
LDI r2, 179
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
