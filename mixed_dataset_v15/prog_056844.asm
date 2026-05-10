; DESCRIPTION: Renders a cyan circular shape at (256, 49) with radius 37.
; PLAN: r0=256(x), r1=49(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 49
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
