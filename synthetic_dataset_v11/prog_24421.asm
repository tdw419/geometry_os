; DESCRIPTION: Draws a orange rectangle at (116, 146) with width 99 and height 55.
; PLAN: r0=116(x), r1=146(y), r2=99(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 146
LDI r2, 99
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
