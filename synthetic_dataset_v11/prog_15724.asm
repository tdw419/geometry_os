; DESCRIPTION: Draws a red circle centered at (167, 124) with radius 25.
; PLAN: r0=167(x), r1=124(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 124
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
