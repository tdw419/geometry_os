; DESCRIPTION: Draws a blue rectangle at (144, 42) with width 92 and height 94.
; PLAN: r0=144(x), r1=42(y), r2=92(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 42
LDI r2, 92
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
