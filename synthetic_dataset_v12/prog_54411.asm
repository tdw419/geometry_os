; DESCRIPTION: Draws a green circle centered at (392, 201) with radius 40.
; PLAN: r0=392(x), r1=201(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 201
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
