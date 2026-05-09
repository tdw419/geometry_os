; DESCRIPTION: Draws a cyan circle centered at (431, 200) with radius 51.
; PLAN: r0=431(x), r1=200(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 200
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
