; DESCRIPTION: Draws a cyan circle centered at (162, 97) with radius 30.
; PLAN: r0=162(x), r1=97(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 97
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
