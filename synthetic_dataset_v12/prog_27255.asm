; DESCRIPTION: Places a orange line segment connecting (450, 154) to (444, 196).
; PLAN: r0=450(x1), r1=154(y1), r2=444(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 154
LDI r2, 444
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
