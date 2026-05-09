; DESCRIPTION: Draws a orange rectangle at (326, 72) with width 28 and height 115.
; PLAN: r0=326(x), r1=72(y), r2=28(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 72
LDI r2, 28
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
