; DESCRIPTION: Places a black line segment connecting (82, 162) to (68, 211).
; PLAN: r0=82(x1), r1=162(y1), r2=68(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 162
LDI r2, 68
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
