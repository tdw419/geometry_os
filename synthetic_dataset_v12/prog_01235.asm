; DESCRIPTION: Draws a green rectangle at (48, 75) with width 26 and height 80.
; PLAN: r0=48(x), r1=75(y), r2=26(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 75
LDI r2, 26
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
