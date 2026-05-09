; DESCRIPTION: Creates a cyan circular shape at (92, 86) with radius 24.
; PLAN: r0=92(x), r1=86(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 86
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
