; DESCRIPTION: Places a orange line segment connecting (206, 96) to (44, 141).
; PLAN: r0=206(x1), r1=96(y1), r2=44(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 96
LDI r2, 44
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
