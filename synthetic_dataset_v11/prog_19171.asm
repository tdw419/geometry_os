; DESCRIPTION: Draws a cyan circle centered at (87, 159) with radius 30.
; PLAN: r0=87(x), r1=159(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 159
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
