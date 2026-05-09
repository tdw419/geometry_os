; DESCRIPTION: Draws a cyan circle centered at (78, 174) with radius 77.
; PLAN: r0=78(x), r1=174(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 174
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
