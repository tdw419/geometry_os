; DESCRIPTION: Draws a red rectangle at (64, 68) with width 67 and height 105.
; PLAN: r0=64(x), r1=68(y), r2=67(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 68
LDI r2, 67
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
