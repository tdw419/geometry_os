; DESCRIPTION: Draws a magenta rectangle at (201, 202) with width 49 and height 42.
; PLAN: r0=201(x), r1=202(y), r2=49(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 202
LDI r2, 49
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
