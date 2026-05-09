; DESCRIPTION: Draws a white rectangle at (67, 36) with width 11 and height 50.
; PLAN: r0=67(x), r1=36(y), r2=11(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 36
LDI r2, 11
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
