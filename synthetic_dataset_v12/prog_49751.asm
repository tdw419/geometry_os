; DESCRIPTION: Draws a cyan circle centered at (424, 122) with radius 79.
; PLAN: r0=424(x), r1=122(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 122
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
