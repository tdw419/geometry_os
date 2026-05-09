; DESCRIPTION: Renders a magenta line between points (432, 23) and (473, 246).
; PLAN: r0=432(x1), r1=23(y1), r2=473(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 23
LDI r2, 473
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
