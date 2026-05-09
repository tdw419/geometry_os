; DESCRIPTION: Draws a orange rectangle at (21, 83) with width 72 and height 55.
; PLAN: r0=21(x), r1=83(y), r2=72(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 83
LDI r2, 72
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
