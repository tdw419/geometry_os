; DESCRIPTION: Draws a yellow circle centered at (84, 42) with radius 19.
; PLAN: r0=84(x), r1=42(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 42
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
