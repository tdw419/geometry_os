; DESCRIPTION: Draws a red circle centered at (197, 174) with radius 39.
; PLAN: r0=197(x), r1=174(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 174
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
