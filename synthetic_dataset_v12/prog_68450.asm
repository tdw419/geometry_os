; DESCRIPTION: Draws a orange rectangle at (280, 7) with width 116 and height 62.
; PLAN: r0=280(x), r1=7(y), r2=116(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 7
LDI r2, 116
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
