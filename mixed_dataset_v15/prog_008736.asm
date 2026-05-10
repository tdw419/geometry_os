; DESCRIPTION: Creates a orange circular shape at (458, 239) with radius 17.
; PLAN: r0=458(x), r1=239(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 239
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
