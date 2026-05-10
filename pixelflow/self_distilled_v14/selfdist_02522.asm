; DESCRIPTION: Renders a orange circular shape at (373, 192) with radius 18.
; PLAN: r0=373(x), r1=192(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 192
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
