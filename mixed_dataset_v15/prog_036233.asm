; DESCRIPTION: Draws a cyan circle centered at (193, 136) with radius 46.
; PLAN: r0=193(x), r1=136(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 136
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
