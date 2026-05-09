; DESCRIPTION: Draws a orange rectangle at (95, 226) with width 59 and height 14.
; PLAN: r0=95(x), r1=226(y), r2=59(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 226
LDI r2, 59
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
