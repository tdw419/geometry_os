; DESCRIPTION: Places a orange line segment connecting (505, 148) to (228, 119).
; PLAN: r0=505(x1), r1=148(y1), r2=228(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 148
LDI r2, 228
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
