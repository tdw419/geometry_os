; DESCRIPTION: Renders a cyan circular shape at (30, 76) with radius 18.
; PLAN: r0=30(x), r1=76(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 76
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
