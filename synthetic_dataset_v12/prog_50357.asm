; DESCRIPTION: Draws a black circle centered at (217, 186) with radius 52.
; PLAN: r0=217(x), r1=186(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 186
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
