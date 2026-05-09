; DESCRIPTION: Renders a magenta line between points (423, 69) and (414, 90).
; PLAN: r0=423(x1), r1=69(y1), r2=414(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 69
LDI r2, 414
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
