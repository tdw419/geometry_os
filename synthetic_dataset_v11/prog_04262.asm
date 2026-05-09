; DESCRIPTION: Draws a orange rectangle at (16, 30) with width 78 and height 92.
; PLAN: r0=16(x), r1=30(y), r2=78(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 30
LDI r2, 78
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
