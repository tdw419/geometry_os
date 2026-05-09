; DESCRIPTION: Draws a white circle centered at (146, 96) with radius 63.
; PLAN: r0=146(x), r1=96(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 96
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
