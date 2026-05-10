; DESCRIPTION: Draws a orange rectangle at (30, 121) with width 86 and height 36.
; PLAN: r0=30(x), r1=121(y), r2=86(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 121
LDI r2, 86
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
