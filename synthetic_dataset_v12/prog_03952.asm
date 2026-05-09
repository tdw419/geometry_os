; DESCRIPTION: Renders a blue line between points (405, 172) and (12, 49).
; PLAN: r0=405(x1), r1=172(y1), r2=12(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 172
LDI r2, 12
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
