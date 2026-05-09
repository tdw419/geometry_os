; DESCRIPTION: Draws a white rectangle at (30, 42) with width 88 and height 116.
; PLAN: r0=30(x), r1=42(y), r2=88(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 42
LDI r2, 88
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
