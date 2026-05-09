; DESCRIPTION: Creates a green circular shape at (217, 222) with radius 19.
; PLAN: r0=217(x), r1=222(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 222
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
