; DESCRIPTION: Draws a cyan circle centered at (81, 148) with radius 72.
; PLAN: r0=81(x), r1=148(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 148
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
