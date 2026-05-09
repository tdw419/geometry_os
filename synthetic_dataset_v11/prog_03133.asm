; DESCRIPTION: Draws a red circle centered at (59, 155) with radius 42.
; PLAN: r0=59(x), r1=155(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 155
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
