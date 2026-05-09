; DESCRIPTION: Renders a orange line between points (224, 79) and (123, 90).
; PLAN: r0=224(x1), r1=79(y1), r2=123(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 79
LDI r2, 123
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
