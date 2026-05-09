; DESCRIPTION: Composite: . Then Renders a blue line between points (241, 69) and (172, 76). Then Renders a red disk with center (118, 77) and radius 67.
; PLAN: r0=241(x1), r1=69(y1), r2=172(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=77(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (241, 69) and (172, 76).
; PLAN: r0=241(x1), r1=69(y1), r2=172(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 69
LDI r2, 172
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (118, 77) and radius 67.
; PLAN: r0=118(x), r1=77(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 77
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
