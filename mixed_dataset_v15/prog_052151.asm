; DESCRIPTION: Draws a orange rectangle at (73, 179) with width 39 and height 69.
; PLAN: r0=73(x), r1=179(y), r2=39(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 179
LDI r2, 39
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
