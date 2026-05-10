; DESCRIPTION: Renders a magenta circular shape at (26, 21) with radius 72.
; PLAN: r0=26(x), r1=21(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 21
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
