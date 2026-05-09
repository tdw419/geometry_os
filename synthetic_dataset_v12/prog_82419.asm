; DESCRIPTION: Draws a yellow circle centered at (244, 133) with radius 50.
; PLAN: r0=244(x), r1=133(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 133
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
