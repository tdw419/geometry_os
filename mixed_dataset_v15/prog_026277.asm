; DESCRIPTION: Renders a magenta line between points (159, 126) and (137, 103).
; PLAN: r0=159(x1), r1=126(y1), r2=137(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 126
LDI r2, 137
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
