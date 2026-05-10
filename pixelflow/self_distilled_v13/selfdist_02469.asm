; DESCRIPTION: Renders a cyan circular shape at (148, 53) with radius 11.
; PLAN: r0=148(x), r1=53(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 53
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
