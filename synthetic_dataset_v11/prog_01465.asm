; DESCRIPTION: Draws a red circle centered at (144, 41) with radius 37.
; PLAN: r0=144(x), r1=41(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 41
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
