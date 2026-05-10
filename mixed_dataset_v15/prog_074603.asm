; DESCRIPTION: Draws a red rectangle at (352, 145) with width 108 and height 29.
; PLAN: r0=352(x), r1=145(y), r2=108(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 145
LDI r2, 108
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
