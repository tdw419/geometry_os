; DESCRIPTION: Renders a magenta line between points (377, 186) and (271, 217).
; PLAN: r0=377(x1), r1=186(y1), r2=271(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 186
LDI r2, 271
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
