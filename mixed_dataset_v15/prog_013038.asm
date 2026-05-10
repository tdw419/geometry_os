; DESCRIPTION: Renders a magenta line between points (393, 176) and (483, 254).
; PLAN: r0=393(x1), r1=176(y1), r2=483(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 176
LDI r2, 483
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
