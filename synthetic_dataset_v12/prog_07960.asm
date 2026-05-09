; DESCRIPTION: Draws a blue rectangle at (350, 26) with width 21 and height 42.
; PLAN: r0=350(x), r1=26(y), r2=21(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 26
LDI r2, 21
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
