; DESCRIPTION: Draws a red circle centered at (360, 161) with radius 69.
; PLAN: r0=360(x), r1=161(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 161
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
