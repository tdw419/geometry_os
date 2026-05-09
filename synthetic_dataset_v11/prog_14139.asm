; DESCRIPTION: Places a black line segment connecting (120, 22) to (166, 205).
; PLAN: r0=120(x1), r1=22(y1), r2=166(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 22
LDI r2, 166
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
