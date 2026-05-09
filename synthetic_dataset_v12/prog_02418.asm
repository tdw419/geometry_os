; DESCRIPTION: Draws a orange rectangle at (296, 10) with width 83 and height 93.
; PLAN: r0=296(x), r1=10(y), r2=83(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 10
LDI r2, 83
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
