; DESCRIPTION: Draws a cyan circle centered at (164, 113) with radius 51.
; PLAN: r0=164(x), r1=113(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 113
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
