; DESCRIPTION: Draws a orange circle centered at (154, 163) with radius 67.
; PLAN: r0=154(x), r1=163(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 163
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
