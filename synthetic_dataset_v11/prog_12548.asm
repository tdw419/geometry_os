; DESCRIPTION: Creates a black circular shape at (242, 80) with radius 14.
; PLAN: r0=242(x), r1=80(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 80
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
