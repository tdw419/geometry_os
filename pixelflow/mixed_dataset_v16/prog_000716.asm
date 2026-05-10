; DESCRIPTION: Draws a magenta rectangle at (251, 42) with width 72 and height 18.
; PLAN: r0=251(x), r1=42(y), r2=72(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 42
LDI r2, 72
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
