; DESCRIPTION: Renders a orange circular shape at (36, 178) with radius 30.
; PLAN: r0=36(x), r1=178(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 178
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
