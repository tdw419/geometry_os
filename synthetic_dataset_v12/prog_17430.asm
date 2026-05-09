; DESCRIPTION: Draws a yellow circle centered at (244, 152) with radius 62.
; PLAN: r0=244(x), r1=152(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 152
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
