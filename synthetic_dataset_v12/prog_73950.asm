; DESCRIPTION: Draws a yellow circle centered at (281, 76) with radius 52.
; PLAN: r0=281(x), r1=76(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 76
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
