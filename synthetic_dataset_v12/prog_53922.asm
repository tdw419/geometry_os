; DESCRIPTION: Draws a green circle centered at (392, 166) with radius 31.
; PLAN: r0=392(x), r1=166(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 166
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
