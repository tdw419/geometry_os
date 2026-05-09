; DESCRIPTION: Places a orange line segment connecting (154, 34) to (27, 70).
; PLAN: r0=154(x1), r1=34(y1), r2=27(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 34
LDI r2, 27
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
