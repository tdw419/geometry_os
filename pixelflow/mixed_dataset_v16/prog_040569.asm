; DESCRIPTION: Renders a blue line between points (20, 237) and (75, 71).
; PLAN: r0=20(x1), r1=237(y1), r2=75(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 237
LDI r2, 75
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
