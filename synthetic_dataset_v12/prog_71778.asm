; DESCRIPTION: Draws a green rectangle at (54, 108) with width 61 and height 75.
; PLAN: r0=54(x), r1=108(y), r2=61(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 108
LDI r2, 61
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
