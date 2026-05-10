; DESCRIPTION: Renders a magenta circular shape at (190, 32) with radius 74.
; PLAN: r0=190(x), r1=32(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 32
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
