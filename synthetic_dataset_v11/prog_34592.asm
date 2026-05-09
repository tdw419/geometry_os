; DESCRIPTION: Places a orange line segment connecting (173, 126) to (12, 140).
; PLAN: r0=173(x1), r1=126(y1), r2=12(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 126
LDI r2, 12
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
