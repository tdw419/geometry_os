; DESCRIPTION: Draws a black circle centered at (180, 177) with radius 73.
; PLAN: r0=180(x), r1=177(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 177
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
