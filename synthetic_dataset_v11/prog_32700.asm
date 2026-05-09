; DESCRIPTION: Renders a blue disk with center (183, 180) and radius 34.
; PLAN: r0=183(x), r1=180(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 180
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
