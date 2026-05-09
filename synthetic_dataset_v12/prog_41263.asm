; DESCRIPTION: Draws a orange rectangle at (213, 75) with width 27 and height 118.
; PLAN: r0=213(x), r1=75(y), r2=27(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 75
LDI r2, 27
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
