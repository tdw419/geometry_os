; DESCRIPTION: Draws a orange rectangle at (52, 184) with width 86 and height 14.
; PLAN: r0=52(x), r1=184(y), r2=86(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 184
LDI r2, 86
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
