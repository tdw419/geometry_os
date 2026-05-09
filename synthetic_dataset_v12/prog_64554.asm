; DESCRIPTION: Draws a red circle centered at (166, 225) with radius 23.
; PLAN: r0=166(x), r1=225(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 225
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
