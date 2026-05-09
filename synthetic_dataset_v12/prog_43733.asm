; DESCRIPTION: Draws a cyan circle centered at (426, 126) with radius 79.
; PLAN: r0=426(x), r1=126(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 126
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
