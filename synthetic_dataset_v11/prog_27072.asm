; DESCRIPTION: Renders a black disk with center (190, 210) and radius 27.
; PLAN: r0=190(x), r1=210(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 210
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
