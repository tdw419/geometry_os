; DESCRIPTION: Draws a magenta rectangle at (48, 39) with width 42 and height 80.
; PLAN: r0=48(x), r1=39(y), r2=42(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 39
LDI r2, 42
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
