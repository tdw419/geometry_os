; DESCRIPTION: Draws a orange rectangle at (156, 166) with width 58 and height 52.
; PLAN: r0=156(x), r1=166(y), r2=58(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 166
LDI r2, 58
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
