; DESCRIPTION: Renders a magenta line between points (205, 252) and (134, 3).
; PLAN: r0=205(x1), r1=252(y1), r2=134(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 252
LDI r2, 134
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
