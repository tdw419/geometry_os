; DESCRIPTION: Draws a red rectangle at (29, 36) with width 40 and height 97.
; PLAN: r0=29(x), r1=36(y), r2=40(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 36
LDI r2, 40
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
