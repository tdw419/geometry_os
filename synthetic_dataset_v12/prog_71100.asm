; DESCRIPTION: Draws a white rectangle at (240, 157) with width 42 and height 54.
; PLAN: r0=240(x), r1=157(y), r2=42(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 157
LDI r2, 42
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
