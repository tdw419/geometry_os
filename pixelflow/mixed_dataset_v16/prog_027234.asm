; DESCRIPTION: Draws a red rectangle at (137, 119) with width 27 and height 15.
; PLAN: r0=137(x), r1=119(y), r2=27(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 119
LDI r2, 27
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
