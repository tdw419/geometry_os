; DESCRIPTION: Renders a magenta line between points (296, 123) and (509, 243).
; PLAN: r0=296(x1), r1=123(y1), r2=509(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 123
LDI r2, 509
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
