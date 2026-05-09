; DESCRIPTION: Places a magenta line segment connecting (477, 47) to (473, 101).
; PLAN: r0=477(x1), r1=47(y1), r2=473(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 47
LDI r2, 473
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
