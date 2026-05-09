; DESCRIPTION: Draws a red circle centered at (195, 144) with radius 80.
; PLAN: r0=195(x), r1=144(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 144
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
