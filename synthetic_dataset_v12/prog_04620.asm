; DESCRIPTION: Draws a cyan circle centered at (339, 135) with radius 27.
; PLAN: r0=339(x), r1=135(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 135
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
