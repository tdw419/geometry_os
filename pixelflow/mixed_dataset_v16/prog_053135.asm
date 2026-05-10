; DESCRIPTION: Renders a blue line segment connecting (319, 39) to (177, 102).
; PLAN: r0=319(x1), r1=39(y1), r2=177(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 39
LDI r2, 177
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
