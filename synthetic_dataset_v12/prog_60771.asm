; DESCRIPTION: Renders a blue line between points (256, 114) and (486, 199).
; PLAN: r0=256(x1), r1=114(y1), r2=486(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 114
LDI r2, 486
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
