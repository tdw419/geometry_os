; DESCRIPTION: Draws a green rectangle at (37, 111) with width 42 and height 88.
; PLAN: r0=37(x), r1=111(y), r2=42(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 111
LDI r2, 42
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
