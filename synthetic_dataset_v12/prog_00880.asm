; DESCRIPTION: Places a black line segment connecting (411, 149) to (373, 47).
; PLAN: r0=411(x1), r1=149(y1), r2=373(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 149
LDI r2, 373
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
