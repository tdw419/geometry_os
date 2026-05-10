; DESCRIPTION: Draws a cyan circle centered at (212, 52) with radius 66.
; PLAN: r0=212(x), r1=52(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 52
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
