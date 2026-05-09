; DESCRIPTION: Draws a red circle centered at (31, 210) with radius 24.
; PLAN: r0=31(x), r1=210(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 210
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
