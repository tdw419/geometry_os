; DESCRIPTION: Draws a green rectangle at (194, 125) with width 14 and height 42.
; PLAN: r0=194(x), r1=125(y), r2=14(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 125
LDI r2, 14
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
