; DESCRIPTION: Renders a black line between points (311, 30) and (3, 154).
; PLAN: r0=311(x1), r1=30(y1), r2=3(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 30
LDI r2, 3
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
