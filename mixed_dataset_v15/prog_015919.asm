; DESCRIPTION: Draws a cyan circle centered at (53, 71) with radius 53.
; PLAN: r0=53(x), r1=71(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 71
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
