; DESCRIPTION: Draws a cyan circle centered at (159, 202) with radius 14.
; PLAN: r0=159(x), r1=202(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 202
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
