; DESCRIPTION: Places a black line segment connecting (78, 186) to (57, 4).
; PLAN: r0=78(x1), r1=186(y1), r2=57(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 186
LDI r2, 57
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
