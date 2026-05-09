; DESCRIPTION: Draws a blue line from (217, 165) to (29, 165).
; PLAN: r0=217(x1), r1=165(y1), r2=29(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 165
LDI r2, 29
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
