; DESCRIPTION: Draws a magenta line from (473, 77) to (486, 182).
; PLAN: r0=473(x1), r1=77(y1), r2=486(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 77
LDI r2, 486
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
