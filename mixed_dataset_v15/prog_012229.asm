; DESCRIPTION: Draws a red circle centered at (280, 80) with radius 61.
; PLAN: r0=280(x), r1=80(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 80
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
