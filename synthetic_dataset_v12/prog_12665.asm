; DESCRIPTION: Renders a magenta line between points (446, 185) and (453, 201).
; PLAN: r0=446(x1), r1=185(y1), r2=453(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 185
LDI r2, 453
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
