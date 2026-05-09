; DESCRIPTION: Draws a red circle centered at (364, 127) with radius 52.
; PLAN: r0=364(x), r1=127(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 127
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
