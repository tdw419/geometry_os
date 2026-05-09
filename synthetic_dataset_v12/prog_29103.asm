; DESCRIPTION: Draws a orange rectangle at (295, 70) with width 47 and height 101.
; PLAN: r0=295(x), r1=70(y), r2=47(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 70
LDI r2, 47
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
