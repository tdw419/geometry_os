; DESCRIPTION: Renders a magenta line between points (216, 174) and (248, 121).
; PLAN: r0=216(x1), r1=174(y1), r2=248(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 174
LDI r2, 248
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
