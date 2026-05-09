; DESCRIPTION: Draws a red circle centered at (104, 73) with radius 57.
; PLAN: r0=104(x), r1=73(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 73
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
