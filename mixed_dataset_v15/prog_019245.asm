; DESCRIPTION: Draws a red rectangle at (203, 81) with width 57 and height 40.
; PLAN: r0=203(x), r1=81(y), r2=57(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 81
LDI r2, 57
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
