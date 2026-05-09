; DESCRIPTION: Draws a red rectangle at (90, 34) with width 90 and height 114.
; PLAN: r0=90(x), r1=34(y), r2=90(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 34
LDI r2, 90
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
