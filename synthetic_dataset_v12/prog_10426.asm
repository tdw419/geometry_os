; DESCRIPTION: Draws a red circle centered at (420, 74) with radius 24.
; PLAN: r0=420(x), r1=74(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 74
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
