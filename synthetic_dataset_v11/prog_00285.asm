; DESCRIPTION: Draws a green rectangle at (57, 30) with width 78 and height 42.
; PLAN: r0=57(x), r1=30(y), r2=78(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 30
LDI r2, 78
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
