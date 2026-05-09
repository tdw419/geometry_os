; DESCRIPTION: Draws a white circle centered at (392, 164) with radius 63.
; PLAN: r0=392(x), r1=164(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 164
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
