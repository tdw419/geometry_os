; DESCRIPTION: Draws a red circle centered at (152, 12) with radius 34.
; PLAN: r0=152(x), r1=12(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 12
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
