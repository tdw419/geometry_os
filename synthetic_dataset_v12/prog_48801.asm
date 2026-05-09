; DESCRIPTION: Draws a cyan circle centered at (90, 121) with radius 17.
; PLAN: r0=90(x), r1=121(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 121
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
