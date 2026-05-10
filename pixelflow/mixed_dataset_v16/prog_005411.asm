; DESCRIPTION: Draws a orange rectangle at (224, 87) with width 75 and height 34.
; PLAN: r0=224(x), r1=87(y), r2=75(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 87
LDI r2, 75
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
