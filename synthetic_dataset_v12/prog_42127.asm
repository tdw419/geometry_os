; DESCRIPTION: Places a black line segment connecting (463, 34) to (347, 213).
; PLAN: r0=463(x1), r1=34(y1), r2=347(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 34
LDI r2, 347
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
