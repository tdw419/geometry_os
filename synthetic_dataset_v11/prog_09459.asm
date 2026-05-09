; DESCRIPTION: Draws a white rectangle at (36, 5) with width 29 and height 28.
; PLAN: r0=36(x), r1=5(y), r2=29(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 5
LDI r2, 29
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
