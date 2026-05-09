; DESCRIPTION: Draws a orange rectangle at (54, 58) with width 79 and height 98.
; PLAN: r0=54(x), r1=58(y), r2=79(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 58
LDI r2, 79
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
