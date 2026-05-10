; DESCRIPTION: Renders a red circular shape at (326, 56) with radius 55.
; PLAN: r0=326(x), r1=56(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 56
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
