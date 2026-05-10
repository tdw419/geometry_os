; DESCRIPTION: Renders a orange circular shape at (326, 111) with radius 66.
; PLAN: r0=326(x), r1=111(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 111
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
