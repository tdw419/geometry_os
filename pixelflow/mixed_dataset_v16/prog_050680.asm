; DESCRIPTION: Draws a green rectangle at (181, 171) with width 77 and height 69.
; PLAN: r0=181(x), r1=171(y), r2=77(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 171
LDI r2, 77
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
