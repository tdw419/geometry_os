; DESCRIPTION: Draws a orange rectangle at (7, 49) with width 76 and height 58.
; PLAN: r0=7(x), r1=49(y), r2=76(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 49
LDI r2, 76
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
