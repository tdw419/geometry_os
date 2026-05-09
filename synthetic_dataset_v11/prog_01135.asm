; DESCRIPTION: Draws a red circle centered at (122, 74) with radius 70.
; PLAN: r0=122(x), r1=74(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 74
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
