; DESCRIPTION: Renders a magenta circular shape at (278, 71) with radius 28.
; PLAN: r0=278(x), r1=71(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 71
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
