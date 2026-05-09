; DESCRIPTION: Draws a yellow circle centered at (418, 80) with radius 16.
; PLAN: r0=418(x), r1=80(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 80
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
