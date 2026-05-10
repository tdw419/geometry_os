; DESCRIPTION: Renders a cyan circular shape at (11, 153) with radius 13.
; PLAN: r0=11(x), r1=153(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 11
LDI r1, 153
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
