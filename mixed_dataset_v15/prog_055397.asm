; DESCRIPTION: Draws a green circle centered at (392, 18) with radius 16.
; PLAN: r0=392(x), r1=18(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 18
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
