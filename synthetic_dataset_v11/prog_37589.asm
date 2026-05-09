; DESCRIPTION: Draws a cyan circle centered at (116, 98) with radius 70.
; PLAN: r0=116(x), r1=98(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 98
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
