; DESCRIPTION: Renders a magenta line between points (453, 60) and (38, 252).
; PLAN: r0=453(x1), r1=60(y1), r2=38(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 60
LDI r2, 38
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
