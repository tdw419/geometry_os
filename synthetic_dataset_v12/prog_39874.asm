; DESCRIPTION: Renders a magenta line between points (287, 157) and (270, 130).
; PLAN: r0=287(x1), r1=157(y1), r2=270(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 157
LDI r2, 270
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
