; DESCRIPTION: Draws a orange rectangle at (220, 75) with width 26 and height 90.
; PLAN: r0=220(x), r1=75(y), r2=26(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 75
LDI r2, 26
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
