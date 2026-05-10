; DESCRIPTION: Renders a orange line segment connecting (203, 42) to (236, 102).
; PLAN: r0=203(x1), r1=42(y1), r2=236(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 42
LDI r2, 236
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
