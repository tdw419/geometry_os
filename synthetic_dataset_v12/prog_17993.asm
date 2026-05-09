; DESCRIPTION: Draws a blue line from (315, 156) to (375, 95).
; PLAN: r0=315(x1), r1=156(y1), r2=375(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 156
LDI r2, 375
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
