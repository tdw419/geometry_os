; DESCRIPTION: Renders a cyan circular shape at (293, 53) with radius 73.
; PLAN: r0=293(x), r1=53(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 53
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
