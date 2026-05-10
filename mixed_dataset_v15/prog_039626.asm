; DESCRIPTION: Renders a orange circular shape at (214, 158) with radius 60.
; PLAN: r0=214(x), r1=158(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 158
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
