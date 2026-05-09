; DESCRIPTION: Draws a orange circle centered at (114, 173) with radius 59.
; PLAN: r0=114(x), r1=173(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 173
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
