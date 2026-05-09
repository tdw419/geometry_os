; DESCRIPTION: Renders a blue line between points (296, 166) and (212, 80).
; PLAN: r0=296(x1), r1=166(y1), r2=212(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 166
LDI r2, 212
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
