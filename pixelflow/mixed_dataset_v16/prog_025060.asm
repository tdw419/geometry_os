; DESCRIPTION: Renders a orange line segment connecting (52, 138) to (329, 63).
; PLAN: r0=52(x1), r1=138(y1), r2=329(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 138
LDI r2, 329
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
