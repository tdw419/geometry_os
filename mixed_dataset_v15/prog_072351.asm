; DESCRIPTION: Draws a black circle centered at (59, 186) with radius 12.
; PLAN: r0=59(x), r1=186(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 186
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
