; DESCRIPTION: Draws a yellow circle centered at (105, 95) with radius 55.
; PLAN: r0=105(x), r1=95(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 95
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
