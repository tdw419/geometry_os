; DESCRIPTION: Renders a orange line between points (137, 130) and (152, 254).
; PLAN: r0=137(x1), r1=130(y1), r2=152(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 130
LDI r2, 152
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
