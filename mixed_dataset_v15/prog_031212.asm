; DESCRIPTION: Draws a cyan circle centered at (407, 132) with radius 57.
; PLAN: r0=407(x), r1=132(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 132
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
