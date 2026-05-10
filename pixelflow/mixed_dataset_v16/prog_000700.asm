; DESCRIPTION: Draws a orange rectangle at (81, 111) with width 107 and height 52.
; PLAN: r0=81(x), r1=111(y), r2=107(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 111
LDI r2, 107
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
