; DESCRIPTION: Draws a red circle centered at (320, 162) with radius 32.
; PLAN: r0=320(x), r1=162(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 162
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
