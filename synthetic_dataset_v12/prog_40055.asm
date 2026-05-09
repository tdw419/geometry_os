; DESCRIPTION: Places a black line segment connecting (453, 42) to (2, 89).
; PLAN: r0=453(x1), r1=42(y1), r2=2(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 42
LDI r2, 2
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
