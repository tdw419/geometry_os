; DESCRIPTION: Draws a orange rectangle at (287, 6) with width 73 and height 109.
; PLAN: r0=287(x), r1=6(y), r2=73(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 6
LDI r2, 73
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
