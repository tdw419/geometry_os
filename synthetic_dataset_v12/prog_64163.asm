; DESCRIPTION: Draws a orange rectangle at (295, 84) with width 87 and height 58.
; PLAN: r0=295(x), r1=84(y), r2=87(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 84
LDI r2, 87
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
