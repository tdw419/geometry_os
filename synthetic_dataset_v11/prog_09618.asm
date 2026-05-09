; DESCRIPTION: Draws a green circle centered at (142, 150) with radius 42.
; PLAN: r0=142(x), r1=150(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 150
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
