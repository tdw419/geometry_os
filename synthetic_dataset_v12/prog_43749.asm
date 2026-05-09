; DESCRIPTION: Creates a cyan circular shape at (256, 73) with radius 40.
; PLAN: r0=256(x), r1=73(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 73
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
