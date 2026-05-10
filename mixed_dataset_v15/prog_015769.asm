; DESCRIPTION: Draws a red circle centered at (176, 127) with radius 32.
; PLAN: r0=176(x), r1=127(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 127
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
