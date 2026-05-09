; DESCRIPTION: Renders a purple line between points (69, 5) and (414, 143).
; PLAN: r0=69(x1), r1=5(y1), r2=414(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 5
LDI r2, 414
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
