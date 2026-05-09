; DESCRIPTION: Draws a red rectangle at (352, 81) with width 61 and height 97.
; PLAN: r0=352(x), r1=81(y), r2=61(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 81
LDI r2, 61
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
