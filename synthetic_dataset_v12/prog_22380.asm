; DESCRIPTION: Draws a orange rectangle at (52, 135) with width 87 and height 52.
; PLAN: r0=52(x), r1=135(y), r2=87(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 135
LDI r2, 87
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
