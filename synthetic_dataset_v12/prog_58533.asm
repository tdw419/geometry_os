; DESCRIPTION: Draws a cyan circle centered at (80, 126) with radius 39.
; PLAN: r0=80(x), r1=126(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 126
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
