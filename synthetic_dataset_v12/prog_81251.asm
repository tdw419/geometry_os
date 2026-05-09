; DESCRIPTION: Renders a magenta line between points (181, 180) and (396, 170).
; PLAN: r0=181(x1), r1=180(y1), r2=396(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 180
LDI r2, 396
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
