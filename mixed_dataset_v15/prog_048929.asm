; DESCRIPTION: Renders a orange circular shape at (60, 43) with radius 54.
; PLAN: r0=60(x), r1=43(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 43
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
