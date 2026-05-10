; DESCRIPTION: Draws a cyan circle centered at (142, 92) with radius 33.
; PLAN: r0=142(x), r1=92(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 92
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
