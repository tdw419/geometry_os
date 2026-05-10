; DESCRIPTION: Renders a cyan circular shape at (324, 73) with radius 47.
; PLAN: r0=324(x), r1=73(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 73
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
