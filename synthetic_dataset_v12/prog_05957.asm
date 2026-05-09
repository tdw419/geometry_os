; DESCRIPTION: Creates a green circular shape at (360, 129) with radius 64.
; PLAN: r0=360(x), r1=129(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 129
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
