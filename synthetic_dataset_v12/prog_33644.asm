; DESCRIPTION: Creates a blue circular shape at (275, 222) with radius 28.
; PLAN: r0=275(x), r1=222(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 222
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
