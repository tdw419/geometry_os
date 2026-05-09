; DESCRIPTION: Renders a orange line between points (152, 3) and (13, 43).
; PLAN: r0=152(x1), r1=3(y1), r2=13(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 3
LDI r2, 13
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
