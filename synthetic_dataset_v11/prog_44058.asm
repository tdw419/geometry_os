; DESCRIPTION: Places a black line segment connecting (107, 186) to (222, 251).
; PLAN: r0=107(x1), r1=186(y1), r2=222(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 186
LDI r2, 222
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
