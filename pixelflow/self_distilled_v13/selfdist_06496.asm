; DESCRIPTION: Renders a cyan circular shape at (163, 171) with radius 10.
; PLAN: r0=163(x), r1=171(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 171
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
