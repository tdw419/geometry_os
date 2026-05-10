; DESCRIPTION: Draws a green rectangle at (282, 187) with width 72 and height 42.
; PLAN: r0=282(x), r1=187(y), r2=72(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 187
LDI r2, 72
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
