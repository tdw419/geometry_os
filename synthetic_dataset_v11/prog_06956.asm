; DESCRIPTION: Renders a magenta line between points (130, 79) and (35, 252).
; PLAN: r0=130(x1), r1=79(y1), r2=35(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 79
LDI r2, 35
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
