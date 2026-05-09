; DESCRIPTION: Places a black line segment connecting (96, 114) to (510, 8).
; PLAN: r0=96(x1), r1=114(y1), r2=510(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 114
LDI r2, 510
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
