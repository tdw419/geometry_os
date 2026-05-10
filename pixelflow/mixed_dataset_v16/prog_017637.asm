; DESCRIPTION: Renders a orange circular shape at (239, 85) with radius 79.
; PLAN: r0=239(x), r1=85(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 85
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
