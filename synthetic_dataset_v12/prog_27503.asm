; DESCRIPTION: Places a blue line segment connecting (184, 246) to (70, 212).
; PLAN: r0=184(x1), r1=246(y1), r2=70(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 246
LDI r2, 70
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
