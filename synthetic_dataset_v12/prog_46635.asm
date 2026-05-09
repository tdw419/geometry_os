; DESCRIPTION: Renders a magenta line between points (364, 155) and (309, 103).
; PLAN: r0=364(x1), r1=155(y1), r2=309(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 155
LDI r2, 309
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
