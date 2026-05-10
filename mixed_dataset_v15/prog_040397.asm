; DESCRIPTION: Draws a blue rectangle at (144, 91) with width 42 and height 29.
; PLAN: r0=144(x), r1=91(y), r2=42(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 91
LDI r2, 42
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
