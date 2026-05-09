; DESCRIPTION: Draws a white circle centered at (207, 127) with radius 46.
; PLAN: r0=207(x), r1=127(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 127
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
