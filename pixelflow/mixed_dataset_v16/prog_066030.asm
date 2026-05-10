; DESCRIPTION: Draws a blue circle centered at (236, 146) with radius 70.
; PLAN: r0=236(x), r1=146(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 146
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
