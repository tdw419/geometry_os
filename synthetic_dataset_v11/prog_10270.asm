; DESCRIPTION: Draws a cyan circle centered at (210, 217) with radius 30.
; PLAN: r0=210(x), r1=217(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 217
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
