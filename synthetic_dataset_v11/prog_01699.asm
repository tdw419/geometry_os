; DESCRIPTION: Draws a red circle centered at (184, 129) with radius 15.
; PLAN: r0=184(x), r1=129(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 129
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
