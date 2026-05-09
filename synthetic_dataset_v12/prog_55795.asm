; DESCRIPTION: Renders a magenta line between points (247, 224) and (159, 80).
; PLAN: r0=247(x1), r1=224(y1), r2=159(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 224
LDI r2, 159
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
