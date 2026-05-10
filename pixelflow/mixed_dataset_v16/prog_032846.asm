; DESCRIPTION: Draws a orange rectangle at (263, 192) with width 78 and height 25.
; PLAN: r0=263(x), r1=192(y), r2=78(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 192
LDI r2, 78
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
