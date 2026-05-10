; DESCRIPTION: Draws a orange rectangle at (228, 33) with width 35 and height 88.
; PLAN: r0=228(x), r1=33(y), r2=35(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 33
LDI r2, 35
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
