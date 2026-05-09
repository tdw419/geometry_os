; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
; PLAN: r0=363(x), r1=134(y), r2=105(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 4301
LDI r1, 121
LDI r2, 91
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT