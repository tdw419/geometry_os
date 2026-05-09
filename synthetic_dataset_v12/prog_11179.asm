; DESCRIPTION: Renders a orange line between points (124, 88) and (350, 154).
; PLAN: r0=124(x1), r1=88(y1), r2=350(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 88
LDI r2, 350
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
