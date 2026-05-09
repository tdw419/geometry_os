; DESCRIPTION: Draws a black circle centered at (54, 80) with radius 48.
; PLAN: r0=54(x), r1=80(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 80
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
