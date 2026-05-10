; DESCRIPTION: Draws a green rectangle at (59, 81) with width 69 and height 72.
; PLAN: r0=59(x), r1=81(y), r2=69(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 81
LDI r2, 69
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
