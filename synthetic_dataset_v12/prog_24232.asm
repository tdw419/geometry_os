; DESCRIPTION: Draws a orange rectangle at (177, 7) with width 60 and height 97.
; PLAN: r0=177(x), r1=7(y), r2=60(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 7
LDI r2, 60
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
