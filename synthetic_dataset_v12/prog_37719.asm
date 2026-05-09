; DESCRIPTION: Renders a orange line between points (326, 162) and (30, 23).
; PLAN: r0=326(x1), r1=162(y1), r2=30(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 162
LDI r2, 30
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
