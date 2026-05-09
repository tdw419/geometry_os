; DESCRIPTION: Draws a cyan circle centered at (191, 121) with radius 61.
; PLAN: r0=191(x), r1=121(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 121
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
