; DESCRIPTION: Draws a orange rectangle at (174, 179) with width 43 and height 24.
; PLAN: r0=174(x), r1=179(y), r2=43(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 179
LDI r2, 43
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
