; DESCRIPTION: Draws a white rectangle at (263, 128) with width 88 and height 74.
; PLAN: r0=263(x), r1=128(y), r2=88(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 128
LDI r2, 88
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
