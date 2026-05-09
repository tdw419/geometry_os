; DESCRIPTION: Draws a yellow circle centered at (435, 161) with radius 72.
; PLAN: r0=435(x), r1=161(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 161
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
