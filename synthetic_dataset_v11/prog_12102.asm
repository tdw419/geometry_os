; DESCRIPTION: Creates a yellow circular shape at (121, 125) with radius 65.
; PLAN: r0=121(x), r1=125(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 125
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
