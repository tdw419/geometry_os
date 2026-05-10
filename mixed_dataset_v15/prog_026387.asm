; DESCRIPTION: Draws a white circle centered at (135, 213) with radius 34.
; PLAN: r0=135(x), r1=213(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 213
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
