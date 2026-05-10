; DESCRIPTION: Draws a cyan circle centered at (302, 132) with radius 66.
; PLAN: r0=302(x), r1=132(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 132
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
