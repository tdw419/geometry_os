; DESCRIPTION: Draws a cyan circle centered at (433, 75) with radius 66.
; PLAN: r0=433(x), r1=75(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 75
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
