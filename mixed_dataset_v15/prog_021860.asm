; DESCRIPTION: Draws a magenta rectangle at (366, 211) with width 42 and height 42.
; PLAN: r0=366(x), r1=211(y), r2=42(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 211
LDI r2, 42
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
