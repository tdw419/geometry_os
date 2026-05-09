; DESCRIPTION: Creates a cyan circular shape at (48, 189) with radius 30.
; PLAN: r0=48(x), r1=189(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 189
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
