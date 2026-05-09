; DESCRIPTION: Draws a cyan circle centered at (77, 70) with radius 69.
; PLAN: r0=77(x), r1=70(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 70
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
