; DESCRIPTION: Draws a blue line from (159, 163) to (30, 36).
; PLAN: r0=159(x1), r1=163(y1), r2=30(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 163
LDI r2, 30
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
