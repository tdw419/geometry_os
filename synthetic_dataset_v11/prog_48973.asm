; DESCRIPTION: Draws a red rectangle at (66, 149) with width 114 and height 74.
; PLAN: r0=66(x), r1=149(y), r2=114(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 149
LDI r2, 114
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
