; DESCRIPTION: Renders a cyan circular shape at (35, 13) with radius 31.
; PLAN: r0=35(x), r1=13(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 13
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
