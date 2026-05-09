; DESCRIPTION: Places a orange line segment connecting (103, 219) to (120, 129).
; PLAN: r0=103(x1), r1=219(y1), r2=120(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 219
LDI r2, 120
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
