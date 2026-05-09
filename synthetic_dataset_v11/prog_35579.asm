; DESCRIPTION: Places a black line segment connecting (7, 66) to (182, 159).
; PLAN: r0=7(x1), r1=66(y1), r2=182(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 66
LDI r2, 182
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
