; DESCRIPTION: Draws a orange rectangle at (146, 49) with width 75 and height 25.
; PLAN: r0=146(x), r1=49(y), r2=75(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 49
LDI r2, 75
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
