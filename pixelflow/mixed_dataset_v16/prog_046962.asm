; DESCRIPTION: Creates a black circular shape at (370, 129) with radius 64.
; PLAN: r0=370(x), r1=129(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 129
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
