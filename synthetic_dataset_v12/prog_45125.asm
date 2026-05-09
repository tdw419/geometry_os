; DESCRIPTION: Draws a red rectangle at (291, 162) with width 109 and height 15.
; PLAN: r0=291(x), r1=162(y), r2=109(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 162
LDI r2, 109
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
