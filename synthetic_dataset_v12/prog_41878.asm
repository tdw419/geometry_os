; DESCRIPTION: Creates a green circular shape at (473, 40) with radius 32.
; PLAN: r0=473(x), r1=40(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 40
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
