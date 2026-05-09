; DESCRIPTION: Draws a red rectangle at (5, 59) with width 105 and height 108.
; PLAN: r0=5(x), r1=59(y), r2=105(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 59
LDI r2, 105
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
