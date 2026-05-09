; DESCRIPTION: Creates a yellow circular shape at (421, 120) with radius 48.
; PLAN: r0=421(x), r1=120(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 120
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
