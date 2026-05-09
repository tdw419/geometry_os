; DESCRIPTION: Renders a blue disk with center (183, 146) and radius 58.
; PLAN: r0=183(x), r1=146(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 146
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
