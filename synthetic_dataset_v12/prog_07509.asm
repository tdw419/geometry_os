; DESCRIPTION: Creates a white circular shape at (205, 129) with radius 45.
; PLAN: r0=205(x), r1=129(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 129
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
