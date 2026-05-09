; DESCRIPTION: Draws a blue circle centered at (450, 236) with radius 12.
; PLAN: r0=450(x), r1=236(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 236
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
