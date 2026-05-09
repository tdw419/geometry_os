; DESCRIPTION: Places a orange line segment connecting (135, 107) to (136, 247).
; PLAN: r0=135(x1), r1=107(y1), r2=136(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 107
LDI r2, 136
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
