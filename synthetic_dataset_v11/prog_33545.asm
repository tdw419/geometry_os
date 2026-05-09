; DESCRIPTION: Renders a magenta line between points (43, 94) and (170, 104).
; PLAN: r0=43(x1), r1=94(y1), r2=170(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 94
LDI r2, 170
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
