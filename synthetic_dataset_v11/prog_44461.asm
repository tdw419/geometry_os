; DESCRIPTION: Places a black line segment connecting (138, 192) to (205, 240).
; PLAN: r0=138(x1), r1=192(y1), r2=205(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 192
LDI r2, 205
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
