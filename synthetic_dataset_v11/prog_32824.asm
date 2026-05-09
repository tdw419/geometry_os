; DESCRIPTION: Composite: . Then Renders a green disk with center (162, 148) and radius 67. Then Renders a blue line between points (238, 182) and (106, 194).
; PLAN: r0=162(x), r1=148(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=238(x1), r1=182(y1), r2=106(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (162, 148) and radius 67.
; PLAN: r0=162(x), r1=148(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 148
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue line between points (238, 182) and (106, 194).
; PLAN: r0=238(x1), r1=182(y1), r2=106(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 182
LDI r2, 106
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
