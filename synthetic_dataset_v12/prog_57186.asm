; DESCRIPTION: Places a orange line segment connecting (463, 177) to (85, 173).
; PLAN: r0=463(x1), r1=177(y1), r2=85(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 177
LDI r2, 85
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
