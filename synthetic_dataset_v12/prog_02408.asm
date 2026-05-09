; DESCRIPTION: Renders a blue line between points (199, 163) and (230, 156).
; PLAN: r0=199(x1), r1=163(y1), r2=230(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 163
LDI r2, 230
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
