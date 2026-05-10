; DESCRIPTION: Renders a orange circular shape at (294, 12) with radius 35.
; PLAN: r0=294(x), r1=12(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 12
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
