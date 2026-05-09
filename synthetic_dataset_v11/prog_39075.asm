; DESCRIPTION: Draws a red circle centered at (215, 108) with radius 30.
; PLAN: r0=215(x), r1=108(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 108
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
