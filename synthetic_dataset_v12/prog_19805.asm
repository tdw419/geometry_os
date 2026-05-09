; DESCRIPTION: Draws a orange rectangle at (213, 22) with width 55 and height 94.
; PLAN: r0=213(x), r1=22(y), r2=55(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 22
LDI r2, 55
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
