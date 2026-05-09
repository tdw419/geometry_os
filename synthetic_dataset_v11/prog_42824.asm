; DESCRIPTION: Draws a white rectangle at (8, 92) with width 66 and height 18.
; PLAN: r0=8(x), r1=92(y), r2=66(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 92
LDI r2, 66
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
