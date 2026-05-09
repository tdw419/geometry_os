; DESCRIPTION: Draws a blue rectangle at (70, 86) with width 42 and height 12.
; PLAN: r0=70(x), r1=86(y), r2=42(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 86
LDI r2, 42
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
