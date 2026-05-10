; DESCRIPTION: Renders a magenta line between points (136, 234) and (252, 50).
; PLAN: r0=136(x1), r1=234(y1), r2=252(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 234
LDI r2, 252
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
