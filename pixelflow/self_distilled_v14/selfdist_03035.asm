; DESCRIPTION: Draws a white circle centered at (220, 46) with radius 21.
; PLAN: r0=220(x), r1=46(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 46
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
