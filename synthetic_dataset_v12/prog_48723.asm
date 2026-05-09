; DESCRIPTION: Renders a magenta line between points (355, 165) and (26, 221).
; PLAN: r0=355(x1), r1=165(y1), r2=26(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 165
LDI r2, 26
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
