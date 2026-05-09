; DESCRIPTION: Draws a yellow circle centered at (216, 209) with radius 30.
; PLAN: r0=216(x), r1=209(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 209
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
