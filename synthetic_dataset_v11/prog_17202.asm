; DESCRIPTION: Renders a magenta line between points (137, 243) and (49, 197).
; PLAN: r0=137(x1), r1=243(y1), r2=49(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 243
LDI r2, 49
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
