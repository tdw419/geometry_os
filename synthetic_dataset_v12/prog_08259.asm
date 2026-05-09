; DESCRIPTION: Draws a white rectangle at (291, 109) with width 72 and height 81.
; PLAN: r0=291(x), r1=109(y), r2=72(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 109
LDI r2, 72
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
