; DESCRIPTION: Draws a red circle centered at (246, 174) with radius 16.
; PLAN: r0=246(x), r1=174(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 174
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
