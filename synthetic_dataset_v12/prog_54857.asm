; DESCRIPTION: Draws a black circle centered at (106, 173) with radius 67.
; PLAN: r0=106(x), r1=173(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 173
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
