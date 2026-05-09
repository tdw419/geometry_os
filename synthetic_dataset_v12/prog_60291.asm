; DESCRIPTION: Draws a yellow circle centered at (262, 141) with radius 37.
; PLAN: r0=262(x), r1=141(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 141
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
