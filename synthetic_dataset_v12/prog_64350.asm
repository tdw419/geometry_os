; DESCRIPTION: Places a orange line segment connecting (200, 239) to (463, 50).
; PLAN: r0=200(x1), r1=239(y1), r2=463(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 239
LDI r2, 463
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
