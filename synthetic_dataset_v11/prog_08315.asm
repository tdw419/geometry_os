; DESCRIPTION: Draws a white rectangle at (53, 0) with width 14 and height 11.
; PLAN: r0=53(x), r1=0(y), r2=14(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 0
LDI r2, 14
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
