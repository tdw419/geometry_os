; DESCRIPTION: Draws a magenta rectangle at (269, 85) with width 16 and height 71.
; PLAN: r0=269(x), r1=85(y), r2=16(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 85
LDI r2, 16
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
