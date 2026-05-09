; DESCRIPTION: Draws a orange rectangle at (255, 30) with width 12 and height 98.
; PLAN: r0=255(x), r1=30(y), r2=12(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 30
LDI r2, 12
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
