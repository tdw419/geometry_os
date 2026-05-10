; DESCRIPTION: Draws a red circle centered at (75, 41) with radius 59.
; PLAN: r0=75(x), r1=41(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 41
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
