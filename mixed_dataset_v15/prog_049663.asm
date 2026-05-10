; DESCRIPTION: Draws a yellow circle centered at (171, 221) with radius 13.
; PLAN: r0=171(x), r1=221(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 221
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
