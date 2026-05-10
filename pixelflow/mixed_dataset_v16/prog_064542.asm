; DESCRIPTION: Draws a orange rectangle at (326, 57) with width 75 and height 83.
; PLAN: r0=326(x), r1=57(y), r2=75(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 57
LDI r2, 75
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
