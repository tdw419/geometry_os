; DESCRIPTION: Draws a white rectangle at (134, 38) with width 22 and height 72.
; PLAN: r0=134(x), r1=38(y), r2=22(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 38
LDI r2, 22
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
