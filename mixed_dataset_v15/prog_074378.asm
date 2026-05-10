; DESCRIPTION: Renders a cyan circular shape at (211, 27) with radius 14.
; PLAN: r0=211(x), r1=27(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 27
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
