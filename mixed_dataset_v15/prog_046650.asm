; DESCRIPTION: Draws a red circle centered at (69, 219) with radius 17.
; PLAN: r0=69(x), r1=219(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 219
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
