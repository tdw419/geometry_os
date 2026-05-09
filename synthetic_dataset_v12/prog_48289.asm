; DESCRIPTION: Draws a white rectangle at (253, 173) with width 67 and height 62.
; PLAN: r0=253(x), r1=173(y), r2=67(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 173
LDI r2, 67
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
