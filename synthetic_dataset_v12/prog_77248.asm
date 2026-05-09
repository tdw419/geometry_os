; DESCRIPTION: Draws a blue line from (375, 13) to (341, 13).
; PLAN: r0=375(x1), r1=13(y1), r2=341(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 13
LDI r2, 341
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
