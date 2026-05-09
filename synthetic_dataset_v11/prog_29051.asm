; DESCRIPTION: Draws a yellow circle centered at (215, 171) with radius 14.
; PLAN: r0=215(x), r1=171(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 171
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
