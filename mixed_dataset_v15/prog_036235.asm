; DESCRIPTION: Creates a cyan circular shape at (435, 188) with radius 62.
; PLAN: r0=435(x), r1=188(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 188
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
