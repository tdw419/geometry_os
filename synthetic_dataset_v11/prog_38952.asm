; DESCRIPTION: Draws a cyan circle centered at (56, 44) with radius 35.
; PLAN: r0=56(x), r1=44(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 44
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
