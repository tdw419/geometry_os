; DESCRIPTION: Renders a cyan circular shape at (129, 71) with radius 26.
; PLAN: r0=129(x), r1=71(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 71
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
