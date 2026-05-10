; DESCRIPTION: Draws a cyan circle centered at (286, 116) with radius 22.
; PLAN: r0=286(x), r1=116(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 116
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
