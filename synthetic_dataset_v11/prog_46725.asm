; DESCRIPTION: Draws a orange rectangle at (206, 75) with width 14 and height 40.
; PLAN: r0=206(x), r1=75(y), r2=14(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 75
LDI r2, 14
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
