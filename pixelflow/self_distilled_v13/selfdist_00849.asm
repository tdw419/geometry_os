; DESCRIPTION: Draws a red circle centered at (374, 60) with radius 32.
; PLAN: r0=374(x), r1=60(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 60
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
