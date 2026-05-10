; DESCRIPTION: Renders a orange circular shape at (304, 73) with radius 50.
; PLAN: r0=304(x), r1=73(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 73
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
