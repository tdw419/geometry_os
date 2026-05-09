; DESCRIPTION: Draws a cyan circle centered at (92, 205) with radius 41.
; PLAN: r0=92(x), r1=205(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 205
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
