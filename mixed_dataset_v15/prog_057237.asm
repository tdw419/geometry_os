; DESCRIPTION: Draws a green circle centered at (220, 164) with radius 57.
; PLAN: r0=220(x), r1=164(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 164
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
