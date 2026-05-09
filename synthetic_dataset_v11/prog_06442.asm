; DESCRIPTION: Draws a white circle centered at (138, 118) with radius 58.
; PLAN: r0=138(x), r1=118(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 118
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
