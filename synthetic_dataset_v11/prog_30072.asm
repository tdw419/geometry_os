; DESCRIPTION: Draws a orange rectangle at (4, 94) with width 24 and height 35.
; PLAN: r0=4(x), r1=94(y), r2=24(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 94
LDI r2, 24
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
