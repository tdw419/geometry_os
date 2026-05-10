; DESCRIPTION: Renders a magenta line between points (424, 43) and (463, 243).
; PLAN: r0=424(x1), r1=43(y1), r2=463(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 43
LDI r2, 463
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
