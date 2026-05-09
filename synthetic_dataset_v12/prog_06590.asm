; DESCRIPTION: Places a black line segment connecting (89, 115) to (273, 154).
; PLAN: r0=89(x1), r1=115(y1), r2=273(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 115
LDI r2, 273
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
