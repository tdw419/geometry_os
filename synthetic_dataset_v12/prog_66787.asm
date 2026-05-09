; DESCRIPTION: Draws a orange rectangle at (52, 12) with width 81 and height 28.
; PLAN: r0=52(x), r1=12(y), r2=81(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 12
LDI r2, 81
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
