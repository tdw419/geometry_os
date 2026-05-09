; DESCRIPTION: Draws a blue circle centered at (281, 53) with radius 44.
; PLAN: r0=281(x), r1=53(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 53
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
