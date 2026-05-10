; DESCRIPTION: Places a orange line segment connecting (435, 154) to (360, 159).
; PLAN: r0=435(x1), r1=154(y1), r2=360(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 154
LDI r2, 360
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
