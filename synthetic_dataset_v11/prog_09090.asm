; DESCRIPTION: Draws a blue rectangle at (42, 94) with width 103 and height 83.
; PLAN: r0=42(x), r1=94(y), r2=103(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 94
LDI r2, 103
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
