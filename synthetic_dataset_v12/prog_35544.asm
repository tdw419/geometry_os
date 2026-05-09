; DESCRIPTION: Draws a cyan circle centered at (175, 135) with radius 26.
; PLAN: r0=175(x), r1=135(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 135
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
