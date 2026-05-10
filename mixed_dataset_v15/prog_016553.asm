; DESCRIPTION: Draws a cyan circle centered at (51, 182) with radius 17.
; PLAN: r0=51(x), r1=182(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 182
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
