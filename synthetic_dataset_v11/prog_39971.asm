; DESCRIPTION: Renders a magenta line between points (46, 115) and (172, 155).
; PLAN: r0=46(x1), r1=115(y1), r2=172(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 115
LDI r2, 172
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
