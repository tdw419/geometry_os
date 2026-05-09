; DESCRIPTION: Draws a red circle centered at (91, 144) with radius 71.
; PLAN: r0=91(x), r1=144(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 144
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
