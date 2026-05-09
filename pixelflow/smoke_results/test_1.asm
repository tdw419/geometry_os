; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
; PLAN: r0=271(x), r1=71(y), r2=119(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 115
LDI r2, 91
LDI r3, 0xFFF00
CIRCLE r0, r1, r2, r3
HALT