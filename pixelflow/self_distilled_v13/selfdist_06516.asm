; DESCRIPTION: Draws a red rectangle at (67, 83) with width 64 and height 91.
; PLAN: r0=67(x), r1=83(y), r2=64(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 83
LDI r2, 64
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
