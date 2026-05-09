; DESCRIPTION: Creates a red circular shape at (17, 175) with radius 14.
; PLAN: r0=17(x), r1=175(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 175
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
