; DESCRIPTION: Draws a cyan circle centered at (381, 207) with radius 29.
; PLAN: r0=381(x), r1=207(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 207
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
