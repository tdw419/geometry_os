; DESCRIPTION: Draws a orange circle centered at (111, 206) with radius 38.
; PLAN: r0=111(x), r1=206(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 206
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
