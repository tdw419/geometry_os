; DESCRIPTION: Draws a red circle centered at (275, 3) with radius 58.
; PLAN: r0=275(x), r1=3(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 3
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
