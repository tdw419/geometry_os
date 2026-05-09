; DESCRIPTION: Draws a red circle centered at (39, 154) with radius 20.
; PLAN: r0=39(x), r1=154(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 154
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
