; DESCRIPTION: Renders a purple circular shape at (386, 190) with radius 78.
; PLAN: r0=386(x), r1=190(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 190
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
