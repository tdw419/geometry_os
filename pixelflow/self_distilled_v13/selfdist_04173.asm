; DESCRIPTION: Renders a cyan circular shape at (321, 6) with radius 19.
; PLAN: r0=321(x), r1=6(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 6
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
