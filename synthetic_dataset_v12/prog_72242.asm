; DESCRIPTION: Renders a magenta line between points (139, 81) and (122, 69).
; PLAN: r0=139(x1), r1=81(y1), r2=122(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 81
LDI r2, 122
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
