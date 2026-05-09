; DESCRIPTION: Renders a magenta line between points (45, 50) and (232, 157).
; PLAN: r0=45(x1), r1=50(y1), r2=232(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 50
LDI r2, 232
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
