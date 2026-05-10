; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
; PLAN: r0=3(x), r1=8(y), r2=8(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 3
LDI r1, 8
LDI r2, 8
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT