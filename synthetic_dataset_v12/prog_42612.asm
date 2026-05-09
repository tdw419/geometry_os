; DESCRIPTION: Draws a cyan circle centered at (431, 180) with radius 47.
; PLAN: r0=431(x), r1=180(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 180
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
