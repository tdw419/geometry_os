; DESCRIPTION: Draws a red circle centered at (109, 186) with radius 31.
; PLAN: r0=109(x), r1=186(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 186
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
