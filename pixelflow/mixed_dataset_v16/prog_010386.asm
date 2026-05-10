; DESCRIPTION: Draws a orange rectangle at (197, 161) with width 40 and height 62.
; PLAN: r0=197(x), r1=161(y), r2=40(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 161
LDI r2, 40
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
