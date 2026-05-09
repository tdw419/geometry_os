; DESCRIPTION: Renders a blue line between points (310, 177) and (68, 25).
; PLAN: r0=310(x1), r1=177(y1), r2=68(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 177
LDI r2, 68
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
