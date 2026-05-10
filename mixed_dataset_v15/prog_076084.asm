; DESCRIPTION: Renders a yellow circular shape at (231, 4) with radius 40.
; PLAN: r0=231(x), r1=4(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 4
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
