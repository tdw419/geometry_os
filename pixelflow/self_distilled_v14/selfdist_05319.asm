; DESCRIPTION: Draws a cyan circle centered at (170, 12) with radius 78.
; PLAN: r0=170(x), r1=12(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 12
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
