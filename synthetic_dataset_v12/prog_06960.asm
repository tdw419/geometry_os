; DESCRIPTION: Draws a orange rectangle at (370, 62) with width 111 and height 74.
; PLAN: r0=370(x), r1=62(y), r2=111(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 62
LDI r2, 111
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
