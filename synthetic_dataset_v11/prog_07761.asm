; DESCRIPTION: Draws a yellow circle centered at (104, 59) with radius 35.
; PLAN: r0=104(x), r1=59(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 59
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
