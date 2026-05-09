; DESCRIPTION: Renders a magenta line between points (296, 205) and (150, 159).
; PLAN: r0=296(x1), r1=205(y1), r2=150(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 205
LDI r2, 150
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
