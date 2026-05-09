; DESCRIPTION: Draws a cyan circle centered at (421, 152) with radius 78.
; PLAN: r0=421(x), r1=152(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 152
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
