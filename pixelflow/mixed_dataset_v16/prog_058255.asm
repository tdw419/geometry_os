; DESCRIPTION: Draws a orange rectangle at (27, 95) with width 59 and height 95.
; PLAN: r0=27(x), r1=95(y), r2=59(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 95
LDI r2, 59
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
