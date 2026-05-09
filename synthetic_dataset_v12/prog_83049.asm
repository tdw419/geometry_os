; DESCRIPTION: Draws a orange rectangle at (326, 69) with width 27 and height 96.
; PLAN: r0=326(x), r1=69(y), r2=27(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 69
LDI r2, 27
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
