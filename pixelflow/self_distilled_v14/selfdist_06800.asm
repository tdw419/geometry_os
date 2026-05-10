; DESCRIPTION: Renders a yellow circular shape at (255, 30) with radius 23.
; PLAN: r0=255(x), r1=30(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 30
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
