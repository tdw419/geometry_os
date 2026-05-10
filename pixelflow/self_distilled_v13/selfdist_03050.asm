; DESCRIPTION: Renders a cyan circular shape at (98, 114) with radius 38.
; PLAN: r0=98(x), r1=114(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 114
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
