; DESCRIPTION: Renders a orange line segment connecting (43, 154) to (32, 134).
; PLAN: r0=43(x1), r1=154(y1), r2=32(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 154
LDI r2, 32
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
