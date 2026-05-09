; DESCRIPTION: Draws a yellow circle centered at (456, 169) with radius 17.
; PLAN: r0=456(x), r1=169(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 169
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
