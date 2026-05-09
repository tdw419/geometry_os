; DESCRIPTION: Creates a green circular shape at (111, 129) with radius 42.
; PLAN: r0=111(x), r1=129(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 129
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
