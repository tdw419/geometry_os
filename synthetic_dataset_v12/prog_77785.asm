; DESCRIPTION: Draws a cyan circle centered at (169, 35) with radius 21.
; PLAN: r0=169(x), r1=35(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 35
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
