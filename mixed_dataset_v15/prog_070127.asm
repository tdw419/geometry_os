; DESCRIPTION: Renders a orange circular shape at (299, 27) with radius 51.
; PLAN: r0=299(x), r1=27(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 27
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
