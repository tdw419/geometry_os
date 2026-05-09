; DESCRIPTION: Draws a green rectangle at (179, 3) with width 58 and height 42.
; PLAN: r0=179(x), r1=3(y), r2=58(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 3
LDI r2, 58
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
