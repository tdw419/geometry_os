; DESCRIPTION: Draws a red circle centered at (337, 72) with radius 71.
; PLAN: r0=337(x), r1=72(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 72
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
