; DESCRIPTION: Draws a yellow circle centered at (439, 131) with radius 25.
; PLAN: r0=439(x), r1=131(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 131
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
