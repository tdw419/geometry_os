; DESCRIPTION: Creates a green circular shape at (374, 194) with radius 35.
; PLAN: r0=374(x), r1=194(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 194
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
