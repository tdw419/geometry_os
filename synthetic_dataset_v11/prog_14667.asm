; DESCRIPTION: Places a orange line segment connecting (206, 103) to (156, 22).
; PLAN: r0=206(x1), r1=103(y1), r2=156(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 103
LDI r2, 156
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
