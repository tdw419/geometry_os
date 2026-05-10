; DESCRIPTION: Draws a orange rectangle at (114, 108) with width 50 and height 61.
; PLAN: r0=114(x), r1=108(y), r2=50(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 108
LDI r2, 50
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
