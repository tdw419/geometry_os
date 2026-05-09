; DESCRIPTION: Creates a red circular shape at (385, 175) with radius 65.
; PLAN: r0=385(x), r1=175(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 175
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
