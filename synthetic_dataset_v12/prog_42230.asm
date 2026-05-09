; DESCRIPTION: Draws a yellow circle centered at (291, 66) with radius 46.
; PLAN: r0=291(x), r1=66(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 66
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
