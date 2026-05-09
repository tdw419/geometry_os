; DESCRIPTION: Draws a green circle centered at (173, 90) with radius 78.
; PLAN: r0=173(x), r1=90(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 90
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
