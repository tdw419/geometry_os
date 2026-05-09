; DESCRIPTION: Creates a black circular shape at (392, 166) with radius 39.
; PLAN: r0=392(x), r1=166(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 166
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
