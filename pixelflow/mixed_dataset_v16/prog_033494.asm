; DESCRIPTION: Draws a cyan circle centered at (214, 110) with radius 73.
; PLAN: r0=214(x), r1=110(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 110
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
