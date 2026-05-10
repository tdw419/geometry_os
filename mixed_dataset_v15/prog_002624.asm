; DESCRIPTION: Draws a red circle centered at (263, 23) with radius 10.
; PLAN: r0=263(x), r1=23(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 23
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
