; DESCRIPTION: Renders a magenta line between points (314, 52) and (126, 159).
; PLAN: r0=314(x1), r1=52(y1), r2=126(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 52
LDI r2, 126
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
