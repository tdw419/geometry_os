; DESCRIPTION: Draws a red circle centered at (303, 151) with radius 77.
; PLAN: r0=303(x), r1=151(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 151
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
