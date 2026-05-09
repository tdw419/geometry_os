; DESCRIPTION: Draws a cyan circle centered at (60, 175) with radius 39.
; PLAN: r0=60(x), r1=175(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 175
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
