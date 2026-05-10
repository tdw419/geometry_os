; DESCRIPTION: Draws a green circle centered at (320, 106) with radius 67.
; PLAN: r0=320(x), r1=106(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 106
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
