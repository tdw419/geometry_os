; DESCRIPTION: Renders a blue line between points (425, 177) and (5, 245).
; PLAN: r0=425(x1), r1=177(y1), r2=5(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 177
LDI r2, 5
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
