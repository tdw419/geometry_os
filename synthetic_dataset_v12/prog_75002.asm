; DESCRIPTION: Draws a orange rectangle at (326, 76) with width 43 and height 48.
; PLAN: r0=326(x), r1=76(y), r2=43(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 76
LDI r2, 43
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
