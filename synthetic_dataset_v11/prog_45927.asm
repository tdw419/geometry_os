; DESCRIPTION: Draws a orange rectangle at (23, 50) with width 117 and height 83.
; PLAN: r0=23(x), r1=50(y), r2=117(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 50
LDI r2, 117
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
