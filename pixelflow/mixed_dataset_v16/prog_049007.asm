; DESCRIPTION: Renders a green circular shape at (376, 113) with radius 56.
; PLAN: r0=376(x), r1=113(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 113
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
