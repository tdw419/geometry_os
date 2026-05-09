; DESCRIPTION: Draws a cyan circle centered at (272, 138) with radius 69.
; PLAN: r0=272(x), r1=138(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 138
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
