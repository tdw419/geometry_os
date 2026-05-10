; DESCRIPTION: Draws a yellow circle centered at (206, 66) with radius 19.
; PLAN: r0=206(x), r1=66(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 66
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
