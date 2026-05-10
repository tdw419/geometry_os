; DESCRIPTION: Draws a orange rectangle at (212, 92) with width 50 and height 69.
; PLAN: r0=212(x), r1=92(y), r2=50(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 92
LDI r2, 50
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
