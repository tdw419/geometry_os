; DESCRIPTION: Draws a red circle centered at (279, 83) with radius 32.
; PLAN: r0=279(x), r1=83(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 83
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
