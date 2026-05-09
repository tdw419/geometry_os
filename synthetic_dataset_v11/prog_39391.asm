; DESCRIPTION: Draws a orange rectangle at (21, 67) with width 64 and height 60.
; PLAN: r0=21(x), r1=67(y), r2=64(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 67
LDI r2, 64
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
