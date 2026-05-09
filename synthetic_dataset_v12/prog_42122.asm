; DESCRIPTION: Draws a orange rectangle at (52, 42) with width 43 and height 61.
; PLAN: r0=52(x), r1=42(y), r2=43(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 42
LDI r2, 43
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
