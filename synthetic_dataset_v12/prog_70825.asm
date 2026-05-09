; DESCRIPTION: Draws a blue circle centered at (242, 176) with radius 61.
; PLAN: r0=242(x), r1=176(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 176
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
