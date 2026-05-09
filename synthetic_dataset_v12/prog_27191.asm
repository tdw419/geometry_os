; DESCRIPTION: Draws a orange rectangle at (332, 146) with width 74 and height 95.
; PLAN: r0=332(x), r1=146(y), r2=74(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 146
LDI r2, 74
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
