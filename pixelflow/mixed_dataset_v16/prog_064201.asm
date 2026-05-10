; DESCRIPTION: Draws a orange rectangle at (85, 62) with width 120 and height 107.
; PLAN: r0=85(x), r1=62(y), r2=120(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 62
LDI r2, 120
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
