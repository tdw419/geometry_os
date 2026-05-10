; DESCRIPTION: Draws a cyan circle centered at (275, 92) with radius 65.
; PLAN: r0=275(x), r1=92(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 92
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
