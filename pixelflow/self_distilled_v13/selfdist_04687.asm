; DESCRIPTION: Draws a blue rectangle at (78, 28) with width 42 and height 95.
; PLAN: r0=78(x), r1=28(y), r2=42(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 28
LDI r2, 42
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
