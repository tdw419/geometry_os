; DESCRIPTION: Draws a cyan circle centered at (83, 92) with radius 60.
; PLAN: r0=83(x), r1=92(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 92
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
