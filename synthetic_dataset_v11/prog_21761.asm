; DESCRIPTION: Draws a yellow circle centered at (76, 150) with radius 54.
; PLAN: r0=76(x), r1=150(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 150
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
