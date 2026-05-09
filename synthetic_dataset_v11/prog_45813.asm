; DESCRIPTION: Draws a cyan circle centered at (116, 60) with radius 45.
; PLAN: r0=116(x), r1=60(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 60
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
