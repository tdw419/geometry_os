; DESCRIPTION: Draws a green rectangle at (1, 93) with width 34 and height 97.
; PLAN: r0=1(x), r1=93(y), r2=34(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 93
LDI r2, 34
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
