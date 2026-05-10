; DESCRIPTION: Renders a magenta circular shape at (286, 5) with radius 72.
; PLAN: r0=286(x), r1=5(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 5
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
