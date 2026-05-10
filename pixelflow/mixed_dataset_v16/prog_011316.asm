; DESCRIPTION: Draws a orange rectangle at (197, 70) with width 19 and height 74.
; PLAN: r0=197(x), r1=70(y), r2=19(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 70
LDI r2, 19
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
