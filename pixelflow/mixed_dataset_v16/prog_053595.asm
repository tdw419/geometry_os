; DESCRIPTION: Draws a purple circle centered at (445, 114) with radius 23.
; PLAN: r0=445(x), r1=114(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 114
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
