; DESCRIPTION: Places a black line segment connecting (399, 13) to (240, 192).
; PLAN: r0=399(x1), r1=13(y1), r2=240(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 13
LDI r2, 240
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
