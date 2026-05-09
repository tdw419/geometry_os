; DESCRIPTION: Renders a magenta line between points (141, 45) and (473, 38).
; PLAN: r0=141(x1), r1=45(y1), r2=473(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 45
LDI r2, 473
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
