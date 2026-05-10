; DESCRIPTION: Draws a cyan circle centered at (302, 81) with radius 61.
; PLAN: r0=302(x), r1=81(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 81
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
