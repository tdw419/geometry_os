; DESCRIPTION: Draws a orange rectangle at (302, 64) with width 67 and height 101.
; PLAN: r0=302(x), r1=64(y), r2=67(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 64
LDI r2, 67
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
