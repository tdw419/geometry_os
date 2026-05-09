; DESCRIPTION: Draws a white rectangle at (434, 6) with width 11 and height 67.
; PLAN: r0=434(x), r1=6(y), r2=11(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 6
LDI r2, 11
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
