; DESCRIPTION: Creates a cyan circular shape at (210, 88) with radius 44.
; PLAN: r0=210(x), r1=88(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 88
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
