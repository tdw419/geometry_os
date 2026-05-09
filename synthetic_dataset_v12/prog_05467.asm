; DESCRIPTION: Draws a blue line from (357, 166) to (380, 155).
; PLAN: r0=357(x1), r1=166(y1), r2=380(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 166
LDI r2, 380
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
