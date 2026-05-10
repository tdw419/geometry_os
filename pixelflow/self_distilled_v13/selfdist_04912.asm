; DESCRIPTION: Renders a cyan circular shape at (361, 23) with radius 57.
; PLAN: r0=361(x), r1=23(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 23
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
