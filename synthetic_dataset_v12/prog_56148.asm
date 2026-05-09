; DESCRIPTION: Creates a black circular shape at (392, 141) with radius 63.
; PLAN: r0=392(x), r1=141(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 141
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
