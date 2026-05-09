; DESCRIPTION: Draws a orange circle centered at (256, 144) with radius 64.
; PLAN: r0=256(x), r1=144(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 144
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
