; DESCRIPTION: Draws a magenta line from (216, 129) to (92, 122).
; PLAN: r0=216(x1), r1=129(y1), r2=92(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 129
LDI r2, 92
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
