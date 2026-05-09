; DESCRIPTION: Draws a green rectangle at (349, 75) with width 39 and height 74.
; PLAN: r0=349(x), r1=75(y), r2=39(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 75
LDI r2, 39
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
