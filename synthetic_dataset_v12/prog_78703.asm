; DESCRIPTION: Draws a orange rectangle at (184, 83) with width 16 and height 73.
; PLAN: r0=184(x), r1=83(y), r2=16(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 83
LDI r2, 16
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
