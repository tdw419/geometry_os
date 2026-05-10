; DESCRIPTION: Draws a yellow circle centered at (16, 131) with radius 20.
; PLAN: r0=16(x), r1=131(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 131
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
