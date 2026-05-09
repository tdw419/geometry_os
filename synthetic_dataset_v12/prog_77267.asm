; DESCRIPTION: Draws a orange rectangle at (43, 48) with width 62 and height 98.
; PLAN: r0=43(x), r1=48(y), r2=62(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 48
LDI r2, 62
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
