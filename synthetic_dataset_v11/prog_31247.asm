; DESCRIPTION: Renders a magenta line between points (216, 1) and (40, 253).
; PLAN: r0=216(x1), r1=1(y1), r2=40(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 1
LDI r2, 40
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
