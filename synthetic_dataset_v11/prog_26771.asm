; DESCRIPTION: Draws a yellow circle centered at (216, 111) with radius 32.
; PLAN: r0=216(x), r1=111(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 111
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
