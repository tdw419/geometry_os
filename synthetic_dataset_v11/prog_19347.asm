; DESCRIPTION: Composite: . Then Renders a white disk with center (142, 73) and radius 69. Then Renders a blue line between points (124, 168) and (204, 202).
; PLAN: r0=142(x), r1=73(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=124(x1), r1=168(y1), r2=204(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (142, 73) and radius 69.
; PLAN: r0=142(x), r1=73(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 73
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue line between points (124, 168) and (204, 202).
; PLAN: r0=124(x1), r1=168(y1), r2=204(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 168
LDI r2, 204
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
