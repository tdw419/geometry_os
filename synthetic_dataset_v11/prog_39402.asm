; DESCRIPTION: Draws a yellow circle centered at (173, 134) with radius 15.
; PLAN: r0=173(x), r1=134(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 134
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
