; DESCRIPTION: Renders a magenta line segment connecting (161, 18) to (83, 141).
; PLAN: r0=161(x1), r1=18(y1), r2=83(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 18
LDI r2, 83
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
