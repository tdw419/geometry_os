; DESCRIPTION: Draws a cyan circle centered at (112, 138) with radius 52.
; PLAN: r0=112(x), r1=138(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 138
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
