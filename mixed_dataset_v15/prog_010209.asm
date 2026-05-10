; DESCRIPTION: Draws a orange rectangle at (146, 34) with width 15 and height 95.
; PLAN: r0=146(x), r1=34(y), r2=15(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 34
LDI r2, 15
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
