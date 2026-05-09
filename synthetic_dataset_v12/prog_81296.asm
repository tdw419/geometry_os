; DESCRIPTION: Draws a magenta rectangle at (401, 6) with width 42 and height 75.
; PLAN: r0=401(x), r1=6(y), r2=42(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 6
LDI r2, 42
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
