; DESCRIPTION: Draws a yellow circle centered at (171, 50) with radius 31.
; PLAN: r0=171(x), r1=50(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 50
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
