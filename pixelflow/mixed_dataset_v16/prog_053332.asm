; DESCRIPTION: Draws a red circle centered at (372, 210) with radius 22.
; PLAN: r0=372(x), r1=210(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 210
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
