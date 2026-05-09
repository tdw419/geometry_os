; DESCRIPTION: Draws a red circle centered at (120, 117) with radius 44.
; PLAN: r0=120(x), r1=117(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 117
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
