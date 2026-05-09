; DESCRIPTION: Draws a cyan circle centered at (200, 182) with radius 56.
; PLAN: r0=200(x), r1=182(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 182
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
