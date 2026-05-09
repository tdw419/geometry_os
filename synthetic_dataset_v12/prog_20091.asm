; DESCRIPTION: Draws a orange rectangle at (412, 143) with width 52 and height 81.
; PLAN: r0=412(x), r1=143(y), r2=52(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 143
LDI r2, 52
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
