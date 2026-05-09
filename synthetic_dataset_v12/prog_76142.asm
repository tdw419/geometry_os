; DESCRIPTION: Draws a red circle centered at (103, 65) with radius 34.
; PLAN: r0=103(x), r1=65(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 65
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
