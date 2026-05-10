; DESCRIPTION: Draws a orange rectangle at (273, 10) with width 16 and height 98.
; PLAN: r0=273(x), r1=10(y), r2=16(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 10
LDI r2, 16
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
