; DESCRIPTION: Renders a cyan circular shape at (373, 122) with radius 10.
; PLAN: r0=373(x), r1=122(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 122
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
