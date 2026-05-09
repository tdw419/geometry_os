; DESCRIPTION: Places a black line segment connecting (455, 186) to (172, 88).
; PLAN: r0=455(x1), r1=186(y1), r2=172(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 186
LDI r2, 172
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
