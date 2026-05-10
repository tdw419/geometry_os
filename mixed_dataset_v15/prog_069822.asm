; DESCRIPTION: Draws a red circle centered at (329, 186) with radius 57.
; PLAN: r0=329(x), r1=186(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 186
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
