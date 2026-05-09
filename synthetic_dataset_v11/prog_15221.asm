; DESCRIPTION: Draws a magenta rectangle at (42, 5) with width 40 and height 70.
; PLAN: r0=42(x), r1=5(y), r2=40(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 5
LDI r2, 40
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
