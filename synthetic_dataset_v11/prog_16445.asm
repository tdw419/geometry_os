; DESCRIPTION: Draws a black circle centered at (202, 185) with radius 32.
; PLAN: r0=202(x), r1=185(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 185
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
