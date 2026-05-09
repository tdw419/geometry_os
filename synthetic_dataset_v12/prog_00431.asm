; DESCRIPTION: Draws a green rectangle at (19, 103) with width 86 and height 42.
; PLAN: r0=19(x), r1=103(y), r2=86(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 103
LDI r2, 86
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
