; DESCRIPTION: Renders a magenta line between points (466, 226) and (377, 104).
; PLAN: r0=466(x1), r1=226(y1), r2=377(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 226
LDI r2, 377
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
