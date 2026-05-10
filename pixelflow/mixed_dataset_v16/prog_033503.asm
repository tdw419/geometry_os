; DESCRIPTION: Draws a cyan circle centered at (70, 77) with radius 35.
; PLAN: r0=70(x), r1=77(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 77
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
