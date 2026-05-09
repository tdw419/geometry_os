; DESCRIPTION: Composite: . Then Renders a white disk with center (53, 92) and radius 48. Then Renders a black line between points (112, 101) and (63, 156).
; PLAN: r0=53(x), r1=92(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=112(x1), r1=101(y1), r2=63(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (53, 92) and radius 48.
; PLAN: r0=53(x), r1=92(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 92
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (112, 101) and (63, 156).
; PLAN: r0=112(x1), r1=101(y1), r2=63(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 101
LDI r2, 63
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
