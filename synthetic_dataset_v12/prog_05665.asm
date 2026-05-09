; DESCRIPTION: Draws a orange rectangle at (118, 50) with width 11 and height 59.
; PLAN: r0=118(x), r1=50(y), r2=11(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 50
LDI r2, 11
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
