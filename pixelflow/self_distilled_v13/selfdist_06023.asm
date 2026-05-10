; DESCRIPTION: Draws a orange rectangle at (192, 86) with width 14 and height 18.
; PLAN: r0=192(x), r1=86(y), r2=14(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 86
LDI r2, 14
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
