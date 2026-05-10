; DESCRIPTION: Draws a cyan circle centered at (458, 112) with radius 15.
; PLAN: r0=458(x), r1=112(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 112
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
