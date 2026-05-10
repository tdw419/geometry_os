; DESCRIPTION: Draws a orange rectangle at (86, 146) with width 85 and height 74.
; PLAN: r0=86(x), r1=146(y), r2=85(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 146
LDI r2, 85
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
