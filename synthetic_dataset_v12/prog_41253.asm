; DESCRIPTION: Creates a black circular shape at (346, 129) with radius 55.
; PLAN: r0=346(x), r1=129(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 129
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
