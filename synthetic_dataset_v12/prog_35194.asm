; DESCRIPTION: Draws a magenta rectangle at (193, 205) with width 61 and height 42.
; PLAN: r0=193(x), r1=205(y), r2=61(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 205
LDI r2, 61
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
