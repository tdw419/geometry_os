; DESCRIPTION: Draws a cyan circle centered at (121, 176) with radius 65.
; PLAN: r0=121(x), r1=176(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 176
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
