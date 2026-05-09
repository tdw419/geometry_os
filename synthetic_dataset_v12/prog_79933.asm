; DESCRIPTION: Draws a orange rectangle at (152, 83) with width 15 and height 95.
; PLAN: r0=152(x), r1=83(y), r2=15(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 83
LDI r2, 15
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
