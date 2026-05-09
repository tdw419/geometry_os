; DESCRIPTION: Renders a blue line between points (18, 230) and (64, 140).
; PLAN: r0=18(x1), r1=230(y1), r2=64(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 230
LDI r2, 64
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
