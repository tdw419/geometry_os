; DESCRIPTION: Draws a yellow circle centered at (411, 221) with radius 30.
; PLAN: r0=411(x), r1=221(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 221
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
