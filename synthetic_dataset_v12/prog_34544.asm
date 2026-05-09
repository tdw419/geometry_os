; DESCRIPTION: Creates a cyan circular shape at (245, 165) with radius 54.
; PLAN: r0=245(x), r1=165(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 165
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
