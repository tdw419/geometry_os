; DESCRIPTION: Places a black line segment connecting (402, 42) to (338, 106).
; PLAN: r0=402(x1), r1=42(y1), r2=338(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 42
LDI r2, 338
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
