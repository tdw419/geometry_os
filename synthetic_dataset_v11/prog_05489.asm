; DESCRIPTION: Draws a green rectangle at (105, 58) with width 42 and height 25.
; PLAN: r0=105(x), r1=58(y), r2=42(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 58
LDI r2, 42
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
