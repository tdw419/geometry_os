; DESCRIPTION: Draws a yellow circle centered at (108, 32) with radius 16.
; PLAN: r0=108(x), r1=32(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 32
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
