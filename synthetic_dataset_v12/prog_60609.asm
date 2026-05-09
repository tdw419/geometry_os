; DESCRIPTION: Draws a green circle centered at (440, 126) with radius 47.
; PLAN: r0=440(x), r1=126(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 126
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
