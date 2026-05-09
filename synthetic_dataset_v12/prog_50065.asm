; DESCRIPTION: Draws a cyan circle centered at (149, 197) with radius 11.
; PLAN: r0=149(x), r1=197(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 197
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
