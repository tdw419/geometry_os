; DESCRIPTION: Creates a orange circular shape at (139, 111) with radius 63.
; PLAN: r0=139(x), r1=111(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 111
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
