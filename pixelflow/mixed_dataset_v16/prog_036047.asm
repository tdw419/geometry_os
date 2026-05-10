; DESCRIPTION: Draws a green rectangle at (270, 148) with width 42 and height 97.
; PLAN: r0=270(x), r1=148(y), r2=42(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 148
LDI r2, 42
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
