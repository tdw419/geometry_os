; DESCRIPTION: Draws a orange rectangle at (324, 178) with width 81 and height 42.
; PLAN: r0=324(x), r1=178(y), r2=81(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 178
LDI r2, 81
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
