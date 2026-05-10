; DESCRIPTION: Creates a red circular shape at (442, 130) with radius 59.
; PLAN: r0=442(x), r1=130(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 130
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
