; DESCRIPTION: Draws a yellow circle centered at (39, 164) with radius 17.
; PLAN: r0=39(x), r1=164(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 164
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
