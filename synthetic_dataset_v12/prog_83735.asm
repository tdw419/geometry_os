; DESCRIPTION: Draws a orange rectangle at (228, 97) with width 47 and height 74.
; PLAN: r0=228(x), r1=97(y), r2=47(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 97
LDI r2, 47
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
