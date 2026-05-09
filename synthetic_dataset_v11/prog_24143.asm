; DESCRIPTION: Draws a cyan circle centered at (138, 50) with radius 15.
; PLAN: r0=138(x), r1=50(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 50
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
