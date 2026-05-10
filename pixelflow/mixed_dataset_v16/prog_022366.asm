; DESCRIPTION: Draws a yellow circle centered at (244, 131) with radius 70.
; PLAN: r0=244(x), r1=131(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 131
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
