; DESCRIPTION: Renders a magenta line between points (93, 234) and (303, 197).
; PLAN: r0=93(x1), r1=234(y1), r2=303(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 234
LDI r2, 303
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
