; DESCRIPTION: Draws a yellow circle centered at (238, 68) with radius 27.
; PLAN: r0=238(x), r1=68(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 68
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
