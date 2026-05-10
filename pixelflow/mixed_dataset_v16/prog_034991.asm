; DESCRIPTION: Renders a magenta line between points (282, 203) and (315, 112).
; PLAN: r0=282(x1), r1=203(y1), r2=315(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 203
LDI r2, 315
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
