; DESCRIPTION: Draws a cyan circle centered at (132, 97) with radius 78.
; PLAN: r0=132(x), r1=97(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 97
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
