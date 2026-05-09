; DESCRIPTION: Draws a cyan circle centered at (35, 39) with radius 28.
; PLAN: r0=35(x), r1=39(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 39
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
