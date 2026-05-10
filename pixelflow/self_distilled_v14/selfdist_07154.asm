; DESCRIPTION: Renders a orange line segment connecting (29, 152) to (361, 99).
; PLAN: r0=29(x1), r1=152(y1), r2=361(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 152
LDI r2, 361
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
