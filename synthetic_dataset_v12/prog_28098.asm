; DESCRIPTION: Draws a black circle centered at (322, 97) with radius 46.
; PLAN: r0=322(x), r1=97(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 97
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
