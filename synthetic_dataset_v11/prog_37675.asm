; DESCRIPTION: Places a green circle of radius 27 at center (139, 224).
; PLAN: r0=139(x), r1=224(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 224
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
