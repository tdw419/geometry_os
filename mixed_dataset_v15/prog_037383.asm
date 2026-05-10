; DESCRIPTION: Renders a cyan circular shape at (266, 195) with radius 23.
; PLAN: r0=266(x), r1=195(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 195
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
