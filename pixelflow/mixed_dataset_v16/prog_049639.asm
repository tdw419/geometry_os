; DESCRIPTION: Draws a orange rectangle at (226, 162) with width 107 and height 54.
; PLAN: r0=226(x), r1=162(y), r2=107(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 162
LDI r2, 107
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
