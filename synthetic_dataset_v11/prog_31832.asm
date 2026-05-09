; DESCRIPTION: Draws a white rectangle at (189, 164) with width 55 and height 67.
; PLAN: r0=189(x), r1=164(y), r2=55(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 164
LDI r2, 55
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
