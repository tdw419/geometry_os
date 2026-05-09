; DESCRIPTION: Renders a magenta line between points (473, 62) and (455, 33).
; PLAN: r0=473(x1), r1=62(y1), r2=455(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 62
LDI r2, 455
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
