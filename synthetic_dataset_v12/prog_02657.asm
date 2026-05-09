; DESCRIPTION: Draws a red rectangle at (352, 187) with width 114 and height 18.
; PLAN: r0=352(x), r1=187(y), r2=114(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 187
LDI r2, 114
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
