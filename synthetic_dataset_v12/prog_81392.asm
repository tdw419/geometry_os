; DESCRIPTION: Draws a black rectangle at (118, 173) with width 114 and height 70.
; PLAN: r0=118(x), r1=173(y), r2=114(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 173
LDI r2, 114
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
