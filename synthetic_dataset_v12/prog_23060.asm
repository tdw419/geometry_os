; DESCRIPTION: Draws a cyan circle centered at (149, 153) with radius 46.
; PLAN: r0=149(x), r1=153(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 153
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
