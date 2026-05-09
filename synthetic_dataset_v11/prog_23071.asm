; DESCRIPTION: Renders a orange line between points (111, 154) and (20, 100).
; PLAN: r0=111(x1), r1=154(y1), r2=20(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 154
LDI r2, 20
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
