; DESCRIPTION: Draws a blue line from (255, 165) to (163, 63).
; PLAN: r0=255(x1), r1=165(y1), r2=163(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 165
LDI r2, 163
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
