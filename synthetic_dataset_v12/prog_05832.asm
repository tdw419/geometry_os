; DESCRIPTION: Draws a red circle centered at (420, 120) with radius 74.
; PLAN: r0=420(x), r1=120(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 120
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
