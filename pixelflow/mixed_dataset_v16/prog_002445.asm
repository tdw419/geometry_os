; DESCRIPTION: Draws a orange rectangle at (304, 80) with width 90 and height 43.
; PLAN: r0=304(x), r1=80(y), r2=90(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 80
LDI r2, 90
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
