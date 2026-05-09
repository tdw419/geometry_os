; DESCRIPTION: Draws a orange circle centered at (197, 106) with radius 47.
; PLAN: r0=197(x), r1=106(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 106
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
