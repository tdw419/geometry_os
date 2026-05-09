; DESCRIPTION: Draws a orange rectangle at (94, 38) with width 74 and height 101.
; PLAN: r0=94(x), r1=38(y), r2=74(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 38
LDI r2, 74
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
