; DESCRIPTION: Draws a white rectangle at (144, 114) with width 42 and height 60.
; PLAN: r0=144(x), r1=114(y), r2=42(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 114
LDI r2, 42
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
