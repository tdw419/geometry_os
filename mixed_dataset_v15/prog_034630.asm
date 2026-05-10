; DESCRIPTION: Renders a magenta line between points (199, 50) and (248, 74).
; PLAN: r0=199(x1), r1=50(y1), r2=248(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 50
LDI r2, 248
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
