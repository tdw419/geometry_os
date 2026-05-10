; DESCRIPTION: Renders a blue line segment connecting (164, 39) to (177, 185).
; PLAN: r0=164(x1), r1=39(y1), r2=177(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 39
LDI r2, 177
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
