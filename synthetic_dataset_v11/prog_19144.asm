; DESCRIPTION: Draws a red circle centered at (152, 100) with radius 74.
; PLAN: r0=152(x), r1=100(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 100
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
