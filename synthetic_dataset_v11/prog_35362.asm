; DESCRIPTION: Draws a red rectangle at (135, 30) with width 113 and height 97.
; PLAN: r0=135(x), r1=30(y), r2=113(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 30
LDI r2, 113
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
