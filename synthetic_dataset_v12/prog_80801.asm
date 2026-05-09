; DESCRIPTION: Draws a orange circle centered at (386, 221) with radius 19.
; PLAN: r0=386(x), r1=221(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 221
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
