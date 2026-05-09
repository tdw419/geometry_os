; DESCRIPTION: Draws a white rectangle at (144, 74) with width 67 and height 85.
; PLAN: r0=144(x), r1=74(y), r2=67(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 74
LDI r2, 67
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
