; DESCRIPTION: Draws a orange rectangle at (42, 118) with width 11 and height 75.
; PLAN: r0=42(x), r1=118(y), r2=11(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 118
LDI r2, 11
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
