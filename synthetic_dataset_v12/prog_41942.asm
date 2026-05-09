; DESCRIPTION: Renders a blue line between points (375, 95) and (212, 204).
; PLAN: r0=375(x1), r1=95(y1), r2=212(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 95
LDI r2, 212
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
