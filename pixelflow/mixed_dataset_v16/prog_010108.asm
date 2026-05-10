; DESCRIPTION: Draws a green rectangle at (450, 61) with width 60 and height 13.
; PLAN: r0=450(x), r1=61(y), r2=60(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 61
LDI r2, 60
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
