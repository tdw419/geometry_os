; DESCRIPTION: Draws a magenta rectangle at (110, 46) with width 103 and height 42.
; PLAN: r0=110(x), r1=46(y), r2=103(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 46
LDI r2, 103
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
