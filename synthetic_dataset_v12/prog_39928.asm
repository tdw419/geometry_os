; DESCRIPTION: Creates a red circular shape at (209, 130) with radius 32.
; PLAN: r0=209(x), r1=130(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 130
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
