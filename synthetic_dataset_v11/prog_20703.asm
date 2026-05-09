; DESCRIPTION: Draws a cyan circle centered at (138, 217) with radius 38.
; PLAN: r0=138(x), r1=217(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 217
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
