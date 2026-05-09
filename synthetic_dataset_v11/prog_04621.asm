; DESCRIPTION: Creates a cyan circular shape at (114, 129) with radius 68.
; PLAN: r0=114(x), r1=129(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 129
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
