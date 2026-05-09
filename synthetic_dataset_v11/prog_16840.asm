; DESCRIPTION: Draws a orange rectangle at (30, 87) with width 47 and height 42.
; PLAN: r0=30(x), r1=87(y), r2=47(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 87
LDI r2, 47
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
