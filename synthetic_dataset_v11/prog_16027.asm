; DESCRIPTION: Draws a cyan circle centered at (126, 79) with radius 73.
; PLAN: r0=126(x), r1=79(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 79
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
