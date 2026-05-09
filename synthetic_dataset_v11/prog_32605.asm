; DESCRIPTION: Draws a orange rectangle at (65, 29) with width 42 and height 30.
; PLAN: r0=65(x), r1=29(y), r2=42(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 29
LDI r2, 42
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
