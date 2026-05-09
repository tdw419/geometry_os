; DESCRIPTION: Draws a blue circle centered at (392, 152) with radius 30.
; PLAN: r0=392(x), r1=152(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 152
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
