; DESCRIPTION: Draws a orange circle centered at (116, 173) with radius 60.
; PLAN: r0=116(x), r1=173(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 173
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
