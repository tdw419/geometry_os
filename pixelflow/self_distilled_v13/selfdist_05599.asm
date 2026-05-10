; DESCRIPTION: Renders a cyan circular shape at (21, 171) with radius 26.
; PLAN: r0=21(x), r1=171(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 171
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
