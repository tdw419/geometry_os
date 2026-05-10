; DESCRIPTION: Draws a green rectangle at (309, 97) with width 120 and height 60.
; PLAN: r0=309(x), r1=97(y), r2=120(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 97
LDI r2, 120
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
