; DESCRIPTION: Renders a yellow circular shape at (231, 83) with radius 31.
; PLAN: r0=231(x), r1=83(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 83
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
