; DESCRIPTION: Draws a red circle centered at (218, 144) with radius 53.
; PLAN: r0=218(x), r1=144(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 144
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
