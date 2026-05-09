; DESCRIPTION: Draws a red circle centered at (108, 34) with radius 32.
; PLAN: r0=108(x), r1=34(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 34
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
