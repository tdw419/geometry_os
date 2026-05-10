; DESCRIPTION: Draws a yellow circle centered at (241, 149) with radius 30.
; PLAN: r0=241(x), r1=149(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 149
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
