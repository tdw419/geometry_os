; DESCRIPTION: Draws a cyan circle centered at (138, 56) with radius 55.
; PLAN: r0=138(x), r1=56(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 56
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
