; DESCRIPTION: Renders a purple circular shape at (190, 27) with radius 18.
; PLAN: r0=190(x), r1=27(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 27
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
