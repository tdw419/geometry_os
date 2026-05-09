; DESCRIPTION: Places a orange line segment connecting (283, 109) to (382, 154).
; PLAN: r0=283(x1), r1=109(y1), r2=382(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 109
LDI r2, 382
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
