; DESCRIPTION: Draws a red rectangle at (59, 72) with width 97 and height 43.
; PLAN: r0=59(x), r1=72(y), r2=97(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 72
LDI r2, 97
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
