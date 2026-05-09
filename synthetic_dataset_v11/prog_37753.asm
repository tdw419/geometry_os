; DESCRIPTION: Draws a orange rectangle at (129, 70) with width 113 and height 107.
; PLAN: r0=129(x), r1=70(y), r2=113(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 70
LDI r2, 113
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
