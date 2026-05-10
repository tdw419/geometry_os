; DESCRIPTION: Draws a cyan circle centered at (81, 134) with radius 13.
; PLAN: r0=81(x), r1=134(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 134
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
