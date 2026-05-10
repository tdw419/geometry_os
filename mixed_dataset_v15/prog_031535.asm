; DESCRIPTION: Places a white line segment connecting (360, 155) to (10, 30).
; PLAN: r0=360(x1), r1=155(y1), r2=10(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 155
LDI r2, 10
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
