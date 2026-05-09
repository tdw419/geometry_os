; DESCRIPTION: Draws a blue rectangle at (162, 95) with width 85 and height 42.
; PLAN: r0=162(x), r1=95(y), r2=85(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 95
LDI r2, 85
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
