; DESCRIPTION: Draws a orange rectangle at (38, 128) with width 71 and height 43.
; PLAN: r0=38(x), r1=128(y), r2=71(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 128
LDI r2, 71
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
