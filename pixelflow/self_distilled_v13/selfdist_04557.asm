; DESCRIPTION: Renders a magenta circular shape at (280, 56) with radius 10.
; PLAN: r0=280(x), r1=56(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 56
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
