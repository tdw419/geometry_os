; DESCRIPTION: Draws a white rectangle at (281, 94) with width 69 and height 67.
; PLAN: r0=281(x), r1=94(y), r2=69(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 94
LDI r2, 69
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
