; DESCRIPTION: Draws a black circle centered at (440, 152) with radius 54.
; PLAN: r0=440(x), r1=152(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 152
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
