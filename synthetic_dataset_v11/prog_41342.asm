; DESCRIPTION: Draws a green circle centered at (76, 70) with radius 65.
; PLAN: r0=76(x), r1=70(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 70
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
