; DESCRIPTION: Renders a cyan circular shape at (68, 48) with radius 33.
; PLAN: r0=68(x), r1=48(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 48
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
