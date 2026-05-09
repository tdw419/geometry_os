; DESCRIPTION: Draws a orange rectangle at (307, 69) with width 28 and height 68.
; PLAN: r0=307(x), r1=69(y), r2=28(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 69
LDI r2, 28
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
