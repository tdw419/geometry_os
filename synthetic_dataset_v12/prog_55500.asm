; DESCRIPTION: Draws a red circle centered at (182, 59) with radius 24.
; PLAN: r0=182(x), r1=59(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 59
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
