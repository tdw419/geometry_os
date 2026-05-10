; DESCRIPTION: Renders a purple disk with center (294, 43) and radius 15.
; PLAN: r0=294(x), r1=43(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 43
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
