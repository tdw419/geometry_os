; DESCRIPTION: Draws a orange rectangle at (15, 59) with width 48 and height 74.
; PLAN: r0=15(x), r1=59(y), r2=48(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 59
LDI r2, 48
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
