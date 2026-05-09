; DESCRIPTION: Draws a magenta rectangle at (255, 103) with width 68 and height 93.
; PLAN: r0=255(x), r1=103(y), r2=68(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 103
LDI r2, 68
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
