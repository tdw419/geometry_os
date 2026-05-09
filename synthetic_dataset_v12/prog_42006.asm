; DESCRIPTION: Draws a orange rectangle at (335, 222) with width 90 and height 32.
; PLAN: r0=335(x), r1=222(y), r2=90(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 222
LDI r2, 90
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
