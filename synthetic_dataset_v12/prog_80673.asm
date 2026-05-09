; DESCRIPTION: Draws a red circle centered at (303, 171) with radius 57.
; PLAN: r0=303(x), r1=171(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 171
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
