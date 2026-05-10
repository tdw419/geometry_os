; DESCRIPTION: Places a black line segment connecting (345, 209) to (47, 90).
; PLAN: r0=345(x1), r1=209(y1), r2=47(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 209
LDI r2, 47
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
