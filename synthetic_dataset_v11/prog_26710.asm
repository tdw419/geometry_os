; DESCRIPTION: Draws a yellow circle centered at (166, 109) with radius 16.
; PLAN: r0=166(x), r1=109(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 109
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
