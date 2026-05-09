; DESCRIPTION: Draws a blue line from (375, 7) to (204, 92).
; PLAN: r0=375(x1), r1=7(y1), r2=204(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 7
LDI r2, 204
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
