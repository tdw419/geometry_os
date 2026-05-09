; DESCRIPTION: Draws a orange rectangle at (227, 72) with width 42 and height 50.
; PLAN: r0=227(x), r1=72(y), r2=42(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 72
LDI r2, 42
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
