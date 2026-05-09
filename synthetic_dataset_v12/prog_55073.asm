; DESCRIPTION: Draws a orange rectangle at (204, 217) with width 98 and height 34.
; PLAN: r0=204(x), r1=217(y), r2=98(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 217
LDI r2, 98
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
