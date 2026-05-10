; DESCRIPTION: Renders a magenta line between points (211, 244) and (413, 155).
; PLAN: r0=211(x1), r1=244(y1), r2=413(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 244
LDI r2, 413
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
