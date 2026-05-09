; DESCRIPTION: Composite: . Then Renders a purple disk with center (134, 112) and radius 67. Then Renders a green line between points (157, 223) and (77, 232).
; PLAN: r0=134(x), r1=112(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=157(x1), r1=223(y1), r2=77(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (134, 112) and radius 67.
; PLAN: r0=134(x), r1=112(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 112
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green line between points (157, 223) and (77, 232).
; PLAN: r0=157(x1), r1=223(y1), r2=77(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 223
LDI r2, 77
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
