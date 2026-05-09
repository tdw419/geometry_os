; DESCRIPTION: Draws a cyan circle centered at (81, 149) with radius 76.
; PLAN: r0=81(x), r1=149(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 149
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
