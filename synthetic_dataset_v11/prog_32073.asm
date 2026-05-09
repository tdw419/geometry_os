; DESCRIPTION: Draws a yellow circle centered at (115, 57) with radius 40.
; PLAN: r0=115(x), r1=57(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 57
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
