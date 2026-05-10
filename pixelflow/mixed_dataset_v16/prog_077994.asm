; DESCRIPTION: Draws a cyan circle centered at (420, 78) with radius 25.
; PLAN: r0=420(x), r1=78(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 78
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
