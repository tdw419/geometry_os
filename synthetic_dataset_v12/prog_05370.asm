; DESCRIPTION: Draws a cyan circle centered at (259, 97) with radius 63.
; PLAN: r0=259(x), r1=97(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 97
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
