; DESCRIPTION: Creates a green circular shape at (137, 129) with radius 44.
; PLAN: r0=137(x), r1=129(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 129
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
