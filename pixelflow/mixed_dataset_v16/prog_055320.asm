; DESCRIPTION: Draws a yellow circle centered at (113, 142) with radius 70.
; PLAN: r0=113(x), r1=142(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 142
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
