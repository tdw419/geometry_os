; DESCRIPTION: Draws a orange circle centered at (394, 166) with radius 21.
; PLAN: r0=394(x), r1=166(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 166
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
