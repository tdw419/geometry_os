; DESCRIPTION: Places a black line segment connecting (96, 94) to (179, 240).
; PLAN: r0=96(x1), r1=94(y1), r2=179(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 94
LDI r2, 179
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
