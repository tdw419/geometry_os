; DESCRIPTION: Renders a magenta line between points (216, 1) and (222, 249).
; PLAN: r0=216(x1), r1=1(y1), r2=222(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 1
LDI r2, 222
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
