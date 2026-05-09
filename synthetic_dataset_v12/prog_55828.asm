; DESCRIPTION: Draws a cyan circle centered at (341, 126) with radius 75.
; PLAN: r0=341(x), r1=126(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 126
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
