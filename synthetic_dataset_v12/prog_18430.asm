; DESCRIPTION: Draws a orange rectangle at (173, 124) with width 62 and height 81.
; PLAN: r0=173(x), r1=124(y), r2=62(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 124
LDI r2, 62
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
