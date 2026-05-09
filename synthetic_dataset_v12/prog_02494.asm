; DESCRIPTION: Draws a cyan circle centered at (180, 134) with radius 19.
; PLAN: r0=180(x), r1=134(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 134
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
