; DESCRIPTION: Draws a orange rectangle at (335, 144) with width 61 and height 39.
; PLAN: r0=335(x), r1=144(y), r2=61(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 144
LDI r2, 61
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
