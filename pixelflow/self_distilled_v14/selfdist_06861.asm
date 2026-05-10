; DESCRIPTION: Draws a white rectangle at (254, 107) with width 112 and height 31.
; PLAN: r0=254(x), r1=107(y), r2=112(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 107
LDI r2, 112
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
